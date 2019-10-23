package com.recon.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;



@SpringBootApplication
@ComponentScan("com.recon")
public class ReconToolWebStarter extends SpringBootServletInitializer {

	public static void main(String args[]) {
		 SpringApplication.run(ReconToolWebStarter.class, args);
	}
}
