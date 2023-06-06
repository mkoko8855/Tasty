package com.midterm.foodSNS.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.result.service.IResultService;
import com.midterm.foodSNS.util.DBservice;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/result")
@Slf4j
public class ResultController {
	
	@Autowired
	private IResultService service;
	
	@Autowired
	private DBservice DBservice;
	
	//home으로
	
	
	//메인 추천 결과 이동
	@PostMapping("/mainResult")
	public String resultMain (String weather, String condition, String feeling, Model model) {
		
		MSearchConditionVO vo = new MSearchConditionVO();
//		if(weather.equals("Clear")) {
//			weather = "맑음";
//		}
//		else if(weather.equals("Rain")) {
//			weather = "비";
//		}
//		else if(weather.equals("Clouds")) {
//			weather = "흐림";
//		}
//		else {
//			weather = "흐림";
//		} 
		
		vo.setWeather(weather);
		log.info(vo.getWeather());
		vo.setCondition2(condition);
		vo.setFeeling(feeling);	
		

		
		model.addAttribute("searchCondition",vo);		
		model.addAttribute("recipe",service.recommand(vo));		
		return "result/mainResult";	
		
	}
	

	
	@GetMapping("/resultDetail")
	public String resultDetail() {
		
		return "result/resultDetail";		
	}
	
	@GetMapping("/getDB")
	public String getDB() {		
		DBservice.getDB();
		return"/home";
		
	}
	@ResponseBody
	@GetMapping("/getWeather")
	public Map<String, Object> getWeather(Model model) {
	 
		model.addAttribute("weather",DBservice.getWeather()); 
	
		
//		String weather = (String) DBservice.getWeather().get("weather");
//		
//		log.info("33333"+weather);
//		
//		if(weather.equals("Clear")) {
//			weather = "맑음";
//		}
//		else if(weather.equals("Rain")) {
//			weather = "비";
//		}
//		else if(weather.equals("Clouds")) {
//			weather = "흐림";
//		}
//		else {
//			weather = "흐림";
//		}
		return DBservice.getWeather();
		
	}
	
	@GetMapping("/recipe/{cooknum}")
	@ResponseBody
	public MRecipeVO detail(@PathVariable int cooknum) {
		return service.recipeDetail(cooknum);
	}
	
	@GetMapping("/recipe/like/{cooknum}")
	@ResponseBody
	public int getLike(@PathVariable int cooknum) {
		log.info("레시피 번호: "+cooknum);
		log.info("좋아요 수" + service.getLike(cooknum));
		return service.getLike(cooknum);
	}
	
	@PutMapping("/recipe/like/{cooknum}")
	@ResponseBody
	public LikeVO updateLike(@PathVariable int cooknum, @RequestBody LikeVO vo) {
		return service.updateLike(cooknum, vo);
	}
	
	
}
