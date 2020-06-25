package com.kosmo.proj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.NotificationService;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService
{
	
	@Resource(name = "notificationDAO")
	private NotificationDAO dao;

}
