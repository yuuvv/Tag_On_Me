package com.ds.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttachDTO extends CommonDTO {

	/** 파일 번호 (PK) */
	private Long bano;

	/** 게시글 번호 (FK) */
	private Long bno;

	/** 원본 파일명 */
	private String originalName;

	/** 저장 파일명 */
	private String saveName;

	/** 파일 크기 */
	private long fileSize;

}
