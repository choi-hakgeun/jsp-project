package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
	String upload = "C:/Users/JHTA/eclipse-workspace/real-web-semi/WebContent/lib/images/"; // 파일을 저장할 경로
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50; // byte 크기
	HttpServletRequest req;
	HttpServletResponse res;
	
	public FileUpload(HttpServletRequest req, HttpServletResponse res) {
		this.req = req;
		this.res = res;
	}
	
	public boolean uploadFormCheck() { // 정상적인 form접근인지 확인
		boolean flag = ServletFileUpload.isMultipartContent(req);
		return flag;
	}
	
	public SCContentVo uploading() {
		SCContentVo vo = new SCContentVo();
		ContentInsertPhoto pvo = new ContentInsertPhoto();
		
		DiskFileItemFactory factory = new DiskFileItemFactory(); // 외워야함
		factory.setSizeThreshold(4096); // 파일을 업로드할때 쓰는 메모리의 크기(버퍼)
		factory.setRepository(new File(tempDir)); // 파일이 저장될때 사용되는 임시 디렉토리
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("UTF-8"); // 파일명등 한글일때 안 깨지게 하기 위함
		sf.setFileSizeMax(maxSize); // 저장될 파일의 최대크기
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			
			for(FileItem fi : list) {
				String v = fi.getString("UTF-8"); // input form의 value를 가져옴
				String k = fi.getFieldName();
				
				if(fi.isFormField()) {
					switch(k) {
					case "c_id": // input type= 'text' name='mId'인가
						vo.setcId(v);
					break;
					
					case "c_name":
						vo.setcName(v);
					break;
					
					case "c_category":
						vo.setCategory(v);
					break;
					
					case "c_genre":
						vo.setGenre(v);
					break;
					
					case "c_story":
						vo.setStory(v);
					break;
					
					case "c_preview":
						vo.setPreview(v);
					break;
					
					case "c_date":
						vo.setDate(v);
						break;
					} // end of switch
				} else {
					if(fi.getSize()>0) {
						
						switch(fi.getFieldName()) {
						case "contentPhoto-thumb":
							String f = fi.getName();
							String sysFile = new Date().getTime() + f;
							
							File file = new File(upload +"thumb/"+ sysFile);
							String path = "/lib/images/thumb/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setThumbPhoto(path);
							break;
						case "contentPhoto-long":
							f = fi.getName();
							sysFile = new Date().getTime() + f;
							
							file = new File(upload +"long/"+ sysFile);
							path = "/lib/images/long/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setLongPhoto(path);
							break;
						case "galleryPhoto1":
							f = fi.getName();
							sysFile = new Date().getTime() + f;
							
							file = new File(upload +"gallery/"+ sysFile);
							path = "/lib/images/gallery/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setGallery1(path);
							break;
						case "galleryPhoto2":
							f = fi.getName();
							sysFile = new Date().getTime() + f;
							
							file = new File(upload +"gallery/"+ sysFile);
							path = "/lib/images/gallery/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setGallery2(path);
							break;
						case "galleryPhoto3":
							f = fi.getName();
							sysFile = new Date().getTime() + f;
							
							file = new File(upload +"gallery/"+ sysFile);
							path = "/lib/images/gallery/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setGallery3(path);
							break;
						case "galleryPhoto4":
							f = fi.getName();
							sysFile = new Date().getTime() + f;
							
							file = new File(upload +"gallery/"+ sysFile);
							path = "/lib/images/gallery/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							pvo.setGallery4(path);
							break;
						}
						
					} // end of i/e file size
				} // end of i/e form field
			} // end of for
			
		} catch (Exception e) {
			e.printStackTrace();
		} // end of t/c
		
		vo.setPvo(pvo);
		
		return vo;
	} // end of if
	
	public HGMemberVo memberUploading() {
		HGMemberVo vo = new HGMemberVo();
		
		DiskFileItemFactory factory = new DiskFileItemFactory(); // 외워야함
		factory.setSizeThreshold(4096); // 파일을 업로드할때 쓰는 메모리의 크기(버퍼)
		factory.setRepository(new File(tempDir)); // 파일이 저장될때 사용되는 임시 디렉토리
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("UTF-8"); // 파일명등 한글일때 안 깨지게 하기 위함
		sf.setFileSizeMax(maxSize); // 저장될 파일의 최대크기
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			
			for(FileItem fi : list) {
				String v = fi.getString("UTF-8"); // input form의 value를 가져옴
				String k = fi.getFieldName();
				
				if(fi.isFormField()) {
					switch(k) {
					case "m_modify_mId": // input type= 'text' name='mId'인가
						vo.setmId(v);
					break;
					
					case "mName":
						vo.setmName(v);
					break;
					
					case "mPhone":
						vo.setmPhone(v);
					break;
					
					case "mProfile":
						vo.setmProfile(v);
					break;
					
					} // end of switch
				} else {
					if(fi.getSize()>0) {
							String f = fi.getName();
							String sysFile = new Date().getTime() + f;
							
							File file = new File(upload +"userPhoto/"+ sysFile);
							String path = "/lib/images/userPhoto/"+sysFile;
							fi.write(file); // 파일을 저장함
							fi.delete(); // 임시파일을 지움
							vo.setmPhoto(path);
					} // end of i/e file size
				} // end of i/e form field
			} // end of for
			
		} catch (Exception e) {
			e.printStackTrace();
		} // end of t/c
		
		return vo;
	} // end of if
	
	public ManagerMovieActorVo movieActorUploading() {
		ManagerMovieActorVo vo = new ManagerMovieActorVo();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);
		factory.setRepository(new File(tempDir));
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("utf-8");
		sf.setFileSizeMax(maxSize);
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			for(FileItem fi : list) {
				String v = fi.getString("utf-8");
				String k = fi.getFieldName();
				
				if(fi.isFormField()) {
					switch(k) {
					case "a_serial":
						vo.setA_serial(v);
					break;
					case "a_id":
						vo.setA_id(v);
					break;
					case "a_name":
						vo.setA_name(v);
					break;
					case "a_position":
						vo.setA_position(Integer.parseInt(v));
					break;
					case "a_work":
						vo.setA_work(v);
					break;
					}
				}else {
					if(fi.getSize()>0) {
						String f = fi.getName();
						String sysFile = new Date().getTime() + f;
						
						File file = new File(upload + "actors/" + sysFile);
						String path = "/lib/images/actors/" + sysFile;
						fi.write(file);
						fi.delete();
						vo.setA_photo(path);
					}
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
} // end of class
