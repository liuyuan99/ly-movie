package com.ly.movie.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ly.movie.dao.MovieMapper;
import com.ly.movie.domain.Movie;
import com.ly.movie.service.MovieService;
import com.ly.movie.vo.MovieVo;

@Service
public class MovieServiceImpl implements MovieService{

	@Resource
	private MovieMapper movieMapper;
	
	@Override
	public List<Movie> selects(MovieVo movieVo) {
		// TODO Auto-generated method stub
		return movieMapper.selects(movieVo);
	}

	@Override
	public boolean del(String id) {
		
		return movieMapper.del(id)>0;
	}

}
