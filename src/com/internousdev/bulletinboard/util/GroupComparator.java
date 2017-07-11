package com.internousdev.bulletinboard.util;

import java.util.Comparator;

import com.internousdev.bulletinboard.dto.MessageDTO;

public class GroupComparator implements Comparator<MessageDTO>{

	@Override
	public int compare(MessageDTO o1, MessageDTO o2) {
		int diff = o1.getCreatedAt().compareTo(o2.getCreatedAt());

		if(diff > 0){
			return -1;
		}else if(diff ==0){
			return 0;
		}else{
			return +1;
		}
	}

}
