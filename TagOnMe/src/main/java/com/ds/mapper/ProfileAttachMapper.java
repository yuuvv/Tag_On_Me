package com.ds.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ds.domain.ProfileAttachVO;

@Mapper
public interface ProfileAttachMapper {
	
	public void insert(ProfileAttachVO vo);
	//public int delProImage(String uuid);
	//public List<BoardAttachVO> findByBno(Long bno);
	//public void deleteAll(Long bno);
	//public List<BoardAttachVO> getOldFiles();
	ProfileAttachVO selectFileName(int uno);
}
