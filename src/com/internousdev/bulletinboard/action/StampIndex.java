package com.internousdev.bulletinboard.action;

import java.util.ArrayList;

import com.internousdev.bulletinboard.dto.StampDTO;
import com.internousdev.bulletinboard.dto.StampTypeDTO;

/**
 * スタンプリストを種別に分けてアレーリストに格納する
 * @author internousdev
 *
 */

public class StampIndex{

	public ArrayList<StampTypeDTO> StampOrder(ArrayList<StampDTO> list) {

		ArrayList<StampTypeDTO> typedStampList =new ArrayList<StampTypeDTO>();
		int type=0;

		for(int i=0;i<list.size();i++){
			StampTypeDTO karidto=new StampTypeDTO();
			ArrayList<StampDTO> kariaray =new ArrayList<StampDTO>();
			type=list.get(i).getTypeId();
			String url=list.get(i).getUrl();

			kariaray.add(list.get(i));

			i++;
			for(;i<list.size();i++){
				if(type==list.get(i).getTypeId()){
					kariaray.add(list.get(i));
				}else{
					i--;
					break;
				}
			}
			karidto.setTypeId(type);
			karidto.setTypedStampList(kariaray);
			karidto.setTypeUrl(url);
			typedStampList.add(karidto);
			}
		return typedStampList;
	}


}
