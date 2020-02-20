package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {

		long currentTime = System.currentTimeMillis();

		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");

		int ranNum = (int) (Math.random() * 100000); // 5자리의 랜덤 숫자 생성

		String name = originFile.getName(); // 원본 파일명 알아내기 -> "aaa.png"

		String ext = ""; // 확장자만 추출해서 담아줄 변수 미리 선언

		int dot = name.lastIndexOf("."); // .의 위치 값 알아내기

		if (dot != -1) { // 존재할 경우
			// dot 포함해서 확장자 추출
			ext = name.substring(dot); // .의 위치값부터 마지막까지 전체 추출 --> ".png"
		}

		// 최종적으로 수정할 파일명
		String fileName = ft.format(new Date(currentTime)) + ranNum + ext;

		// 파일을 변경된 파일명으로 생성
		File newFile = new File(originFile.getParent(), fileName);

		return newFile;

	}

}
