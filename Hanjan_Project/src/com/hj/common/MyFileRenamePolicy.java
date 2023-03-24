package com.hj.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;



public class MyFileRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File originFile) {
		//원본 파일명 뽑기- 확장자를 알아야되서 확장자는 보호해야하닌까=> 매개젼수로 전달받은 원본파일부터
		String originName=originFile.getName();
		
		//수정 파일명 만들기(규칙)=> 최대한 이름이 겹치지 않도록!!!!!!!
		//이렇게 해보자(카톡따라하기) 파일이업로드된 시간(년월일시분초)+5자리 랜덤값(10000~99999) +확장자
		
		/*
		 * 원본명			수정명
		 * aaa.jpg	=>	Kakao_20221116170830.jpg 형태로 변환
		 * 
		 */
		
		//1.팡리이 업로드된 시간추출=> String currentTime
		//SimpleDateFormat 활용
		String currentTime=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//2. 5자리 랜덤값 추출=> int ranNum;
		//Math 활용
		int ranNum= (int) (Math.random() * 90000)+10000;
		
		//3.확장자 뽑기->String ext
		//lastIndexOf(찾고자하는 문자열)+subString()
		String ext=originName.substring(originName.lastIndexOf("."));
		
		// 1+ 2+3조합해서 수정파일명을 변수에 담자
		String changeName="hanjan_"+currentTime+"_"+ranNum+ext;
		
		//기존 파일을 수정된 파일명으로 적용시켜서  리턴
		return new File(originFile.getParent(),changeName);
		
		
		
	}
}
