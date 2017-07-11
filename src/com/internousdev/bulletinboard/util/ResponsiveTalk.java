package com.internousdev.bulletinboard.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;

import com.internousdev.bulletinboard.dao.BotDAO;
import com.internousdev.bulletinboard.dto.BotDTO;
/**
 * botの返信に関するメソッド
 * @author internousdev
 * @since 2017/06/26
 * @version 1.0
 */
public class ResponsiveTalk {

	BotDAO dao = new BotDAO();

	/**
	 * もらった発言
	 */
	private String text;

	/**
	 * もらった発言をセットする
	 * @param text 貰った発言
	 */
	public ResponsiveTalk(String text){
		this.text = text;
	}

	/**
	 * 貰った発言を単語で分けてリスト化するメソッド
	 * @return 単語のリスト
	 */
	public ArrayList<BotDTO> wordSeparator(){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();

		Tokenizer tokenizer = Tokenizer.builder().build();
		List<Token> tokens = tokenizer.tokenize(text);

		for (Token token : tokens) {
			BotDTO dto = new BotDTO();
			dto.setWord(token.getSurfaceForm());
			dto.setPartOfSpeech(token.getPartOfSpeech());
			dto.setParts(token.getAllFeaturesArray()[6]);
			dto.setDictionary(token.isKnown());
			wordList.add(dto);
		}
		return wordList;
	}

	/**
	 * 反応を自動生成するメソッド
	 * @return 自動生成された反応
	 */
	public String responseGenerate(){
		ArrayList<BotDTO> talkList = new ArrayList<BotDTO>();
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		talkList = wordSeparator();
		String result = null;
		for(int i=0;i<talkList.size();i++){
			if(talkList.get(i).getPartOfSpeech().contains("名詞") || talkList.get(i).getPartOfSpeech().contains("形容詞")){
				if(talkList.get(i).getParts().equals("*")){
					wordList = dao.wordSearch(talkList.get(i).getWord());
				}else{
					wordList = dao.wordSearch(talkList.get(i).getParts());
				}
				if(wordList.size()!=0){
					result = responseMake(talkList.get(i).getWord());
					break;
				}
			}
		}
		return result;
	}

	/**
	 * テーブルに単語がない場合の反応を生成するメソッド
	 * @return 反応
	 */
	public String responseThink(){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		wordList = wordSeparator();
		String result = "そうだね";
		for(int i=0;i<wordList.size();i++){
			if(!wordList.get(i).isDictionary()){
				result = wordList.get(i).getWord() + "は辞書に載ってない言葉だ";
				break;
			}else if(wordList.get(i).getPartOfSpeech().contains("形容詞")){
				result = wordList.get(i).getParts() + "んだ";
				break;
			}else if(wordList.get(i).getPartOfSpeech().contains("名詞")){
				result = wordList.get(i).getParts() + "かー";
				break;
			}
		}
		return result;
	}

	/**
	 * リスト化した投稿情報をもとに、どの言葉を一番用いているか検索するメソッド
	 * @param userId
	 * @return
	 */
	public String timelineAnalysis(int userId){
		String result = null;
		ArrayList<String> contentsList = new ArrayList<String>();
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		contentsList = dao.getText(userId);
		int maxCount = 0;
		int maxId = 0;
		int flgCount = 0;

		for(int i=0;i<contentsList.size();i++){
			Tokenizer tokenizer = Tokenizer.builder().build();
			List<Token> tokens = tokenizer.tokenize(contentsList.get(i));


			for (Token token : tokens) {
				BotDTO dto = new BotDTO();
				dto.setWord(token.getSurfaceForm());
				dto.setPartOfSpeech(token.getPartOfSpeech());
				dto.setParts(token.getAllFeaturesArray()[6]);
				dto.setDictionary(token.isKnown());
				wordList.add(dto);
				//辞書にない言葉をどのくらいつぶやいてるか確認
				if(!token.isKnown()){
					flgCount ++;
				}
			}

		}
		if(wordList.size()==0){
			result = "タイムラインをまだ書いてないね。レベルアップのためにもたくさん投稿するといいよ";
			//単語数が20に満たない場合
		}else if(wordList.size()<20){
			result = "もっとタイムラインを投稿するといいよ";
			//辞書にない言葉を半数以上使っていた場合
		}else if(flgCount > (wordList.size()/2)){
			result = "難しいことをたくさん投稿しているんだね";
		}else{
			//どの言葉をたくさん投稿しているか確認
			for(int i=0;i<wordList.size();i++){
				int partsCount = 0;
				if(wordList.get(i).isDictionary()){
				for(int n= i+1;n<wordList.size();n++){
					if(wordList.get(i).getParts().equals(wordList.get(n).getParts())){
						partsCount++;
					}
				}
				if(partsCount > maxCount){
					maxCount = partsCount;
					maxId = i;
				}
			}
			}
			result = "「" + wordList.get(maxId).getParts() + "」の言葉を一番投稿しているね";
		}
		return result;
	}




	/**
	 * リストをもとに、次に続く言葉を、次に続きやすいランキング上位3つのうちから1つ選ぶメソッド
	 * @param wordList
	 * @return
	 */
	public String wordAnalysis(ArrayList<BotDTO> wordList){
		String result = null;
		//上位3つの言葉が出てきた回数
		int firstCount=0;int secondCount=0;int thirdCount= 0;
		//上位3つの言葉のリスト階層
		int firstId=0;int secondId=0;int thirdId=0;

		if(wordList.size()==0){
			return result;
		}else{
			for(int i=0;i<wordList.size();i++){
				int partsCount = 0;
				if(i==0){
					for(int n= 0;n<wordList.size();n++){
						if(wordList.get(i).getWord().equals(wordList.get(n).getWord())){
							partsCount++;
						}
					}
				}else{
					if(wordList.get(i).getWord().equals(wordList.get(firstId).getWord()) || wordList.get(i).getWord().equals(wordList.get(secondId).getWord()) || wordList.get(i).getWord().equals(wordList.get(thirdId).getWord())){
					}else{
						for(int n= 0;n<wordList.size();n++){
							if(wordList.get(i).getWord().equals(wordList.get(n).getWord())){
								partsCount++;
							}
						}
					}

				}
				if(partsCount > thirdCount){
					thirdCount = partsCount;
					thirdId = i;
				}
				if(thirdCount > secondCount){
					thirdCount = secondCount;
					secondCount = partsCount;
					thirdId = secondId;
					secondId = i;
				}
				if(secondCount > firstCount){
					secondCount = firstCount;
					firstCount = partsCount;
					secondId = firstId;
					firstId = i;
				}
			}
			Random rnd = new Random();
			int ran = rnd.nextInt(3)+1;
			switch(ran){
			case 1:ran = firstId;break;
			case 2:ran = secondId;break;
			case 3:ran = thirdId;break;
			}
			if(secondCount==0){
				result = wordList.get(firstId).getWord();
			}else if(thirdCount==0 && ran==thirdId){
					result = wordList.get(firstId).getWord();
			}else{
				result = wordList.get(ran).getWord();
			}
		}
		return result;
	}

	/**
	 * 統計をもとに言葉を作成する
	 * @param word
	 * @return
	 */
	public String responseMake(String word){
		String result = null;
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		wordList = dao.wordSearch(word);
		String addWord = wordAnalysis(wordList);
		if(addWord != null){
			result = addWord;
		}else{
			return result;
		}
		while(result.length()<160){
			wordList = dao.phaseSearch(addWord);
			addWord = wordAnalysis(wordList);
			switch(addWord){
			case "":
				return result;
			case "。":
				return result;
			default:
				result += addWord;
				break;
			}
		}


		return result;
	}

}
