package com.avg12.betweeny.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;

import net.nurigo.java_sdk.Coolsms;


@Lazy
@PropertySource("classpath:defaultConfig/application-com.properties")
public class SampleSender {

	@Value("${coolsms.apikey}")
	private String api_key;

	@Value("${coolsms.secretkey}")
	private String api_secret;

	
	private Coolsms sms;
	
	public SampleSender() {
		
		sms = new Coolsms(api_key, api_secret);
	}
	
	
	
	
	
}
