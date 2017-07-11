package com.internousdev.bulletinboard.util;

import java.util.ArrayList;
import java.util.List;

import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;

import com.internousdev.bulletinboard.dto.BotDTO;

/**
 * botが文章を学習するためのクラス
 * @author Misa Kikuchi
 * @since 2017/06/26
 * @version 1.0
 */
public class BotExercise {

	/**
	 * 教える文章
	 */
	private String sentence;

	/**
	 * 教える文章をセットする
	 * @param sentence 教える文章
	 */
	public BotExercise(String sentence){
		this.sentence = sentence;
	}

	/**
	 * 文章を単語に分けてリスト化するメソッド
	 * @return 単語のリスト
	 */
	public ArrayList<BotDTO> wordSeparate(){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();

		Tokenizer tokenizer = Tokenizer.builder().build();
		List<Token> tokens = tokenizer.tokenize(sentence);
		for (Token token : tokens) {
			BotDTO dto = new BotDTO();
			dto.setWord(token.getSurfaceForm()); //単語
			dto.setPartOfSpeech(token.getPartOfSpeech()); //品詞
			dto.setParts(token.getAllFeaturesArray()[6]); //単語の基本形
			dto.setDictionary(token.isKnown()); //kuromojiの辞書に載ってるか
			wordList.add(dto);
		}
		return wordList;
	}

	/**
	 * 単語のリストを文節で文章を分ける形に変更するメソッド
	 * @param wordList 文節のリスト
	 * @return
	 */
	public ArrayList<BotDTO> wordConbine(){
		ArrayList<BotDTO> wordList = new ArrayList<BotDTO>();
		wordList = wordSeparate();
		//単語の次に助詞・助動詞があった場合はくっつける
		for(int i=0;i<(wordList.size()-1);i++){
			if(wordList.get(i+1).getPartOfSpeech().contains("助詞") || wordList.get(i+1).getPartOfSpeech().contains("助動詞")){
				//記号と助詞助動詞はくっつけない
				if(!wordList.get(i).getPartOfSpeech().contains("記号")){
					wordList.get(i).setWord(wordList.get(i).getWord() + wordList.get(i+1).getWord());
					wordList.remove(i+1);
					i--;
				}
			}
		}

		return wordList;
	}

	/**
	 * 空白などの余分なものを除去するメソッド
	 * @param wordList
	 * @return
	 */
	public ArrayList<BotDTO> wordRemover(ArrayList<BotDTO> wordList){
		for(int i=0;i<(wordList.size()-1);i++){
			if(wordList.get(i).getPartOfSpeech().contains("空白")){
				wordList.remove(i);
				i--;
			}else if(wordList.get(i).getWord().equals("\r")){
				wordList.remove(i);
				i--;
			}else if(wordList.get(i).getWord().equals("\n")){
				wordList.remove(i);
				i--;
			}
		}
		return wordList;
	}

	/**
	 * 読点をその前の言葉につなげるメソッド
	 * @param wordList
	 * @return
	 */
	public ArrayList<BotDTO> readingPointConbine(ArrayList<BotDTO> wordList){
		for(int i=0;i<(wordList.size()-1);i++){
			if(wordList.get(i+1).getPartOfSpeech().contains("読点")){
				wordList.get(i).setWord(wordList.get(i).getWord() + wordList.get(i+1).getWord());
				wordList.remove(i+1);
			}
		}
		return wordList;
	}

	/**
	 * 括弧の開始から終わりまでを一つの文章として扱うメソッド
	 * @param wordList
	 * @return
	 */
	public ArrayList<BotDTO> bracketsConbine(ArrayList<BotDTO> wordList){

		for(int i=0;i<(wordList.size()-1);i++){
			if(wordList.get(i).getPartOfSpeech().contains("括弧開")){
				while(!(wordList.get(i+1).getPartOfSpeech().contains("括弧閉"))){
					wordList.get(i).setWord(wordList.get(i).getWord() + wordList.get(i+1).getWord());
					wordList.remove(i+1);
				}
			}
			if(wordList.get(i).getPartOfSpeech().contains("括弧閉")){
				wordList.get(i-1).setWord(wordList.get(i-1).getWord() + wordList.get(i).getWord());
				wordList.remove(i);
				i--;
			}
		}
		return wordList;
	}

	/**
	 * 青空文庫のテキストを整えるメソッド
	 * @param wordList
	 * @return
	 */
	public ArrayList<BotDTO> aozoraRemover(ArrayList<BotDTO> wordList){
		for(int i=0;i<(wordList.size()-1);i++){
			if(wordList.get(i).getWord().contains("《")){
				wordList.remove(i);
				i--;
			}else if(wordList.get(i).getWord().contains("［")){
				wordList.remove(i);
				while(!wordList.get(i).getWord().contains("］")){
					wordList.remove(i);
				}
				wordList.remove(i);
				while(!wordList.get(i).getWord().contains("］")){
					wordList.remove(i);
				}
				wordList.remove(i);
				i--;
			}
		}
		return wordList;
	}

}
