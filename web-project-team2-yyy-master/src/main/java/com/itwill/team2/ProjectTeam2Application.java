package com.itwill.team2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class ProjectTeam2Application {

	public static void main(String[] args) {
		SpringApplication.run(ProjectTeam2Application.class, args);
	}

}
