package com.internousdev.bulletinboard.action;



import com.opensymphony.xwork2.ActionSupport;

public class GroupTokenAction extends ActionSupport
{
    private String groupName;

    public String getName() {
        return groupName;
    }
    public void setgroupName(String groupName) {
        this.groupName = groupName;
    }
}