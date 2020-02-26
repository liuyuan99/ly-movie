package com.ly.movie.service;

import java.util.List;

import com.ly.movie.domain.Movie;
import com.ly.movie.vo.MovieVo;

public interface MovieService {

	//模糊查询
	List<Movie> selects(MovieVo movieVo);

	boolean del(String id);
}
