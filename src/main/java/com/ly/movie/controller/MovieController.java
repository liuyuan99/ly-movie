package com.ly.movie.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.movie.domain.Movie;
import com.ly.movie.service.MovieService;
import com.ly.movie.vo.MovieVo;

@Controller
public class MovieController {

	@Resource
	private MovieService service;
	
	@RequestMapping("selects")
	public String list(MovieVo movieVo,Model m) {
		if(movieVo.getPageNum()==null) {
			movieVo.setPageNum(1);
		}
		PageHelper.startPage(movieVo.getPageNum(), 3);
		List<Movie> movie = service.selects(movieVo);
		PageInfo<Movie> page = new PageInfo<Movie>(movie);
		m.addAttribute("page", page);
		m.addAttribute("movie", movie);
		m.addAttribute("movieVo", movieVo);
		return "movies";
	}
	
	@ResponseBody
	@RequestMapping("del")
	public Object del(String id) {
		boolean msg = service.del(id);
		return msg;
	}
	
}
