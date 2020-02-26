package com.ly.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ly.movie.domain.Movie;
import com.ly.movie.vo.MovieVo;

public interface MovieMapper {

	//模糊查询
	List<Movie> selects(MovieVo movieVo);

	int del(String id);
}
