package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.ProductVO;
import kr.co.service.AttachService;
import kr.co.utils.UploadUtils;

@Controller
@RequestMapping("/productimg")
public class ImgComtroller {
	
	@Inject
	private AttachService aService;
	
	@Inject
	private ServletContext ctx;
	
	@Resource(name = "productupload")
	private String productupload;
	
	@RequestMapping(value = "/uploadajax", method = RequestMethod.GET)
	public void uploadAjax() {
	}
	
	@RequestMapping(value = "/uploadajaxNdb/{pid}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadajaxNdb(@PathVariable("pid") String pid, MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;

		try {
			MultipartFile file = request.getFile("file");
			String originalName = file.getOriginalFilename();
			String uploadpath = ctx.getRealPath(this.productupload);

			String uploadedFilename = UploadUtils.uploadFile(file, originalName, uploadpath);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pid", pid);
			map.put("filename", uploadedFilename);

			int result = aService.insert(map);
			if (result == 0) {
				String formatName = UploadUtils.getFormatName(uploadedFilename);
				MediaType mType = UploadUtils.getMediaType(formatName);
				if (mType != null) {

					String originalImageFilename = UploadUtils.getOriginalImageFilename(uploadedFilename);
					File f2 = new File(uploadpath, originalImageFilename);
					f2.delete();
				}

				File f = new File(uploadpath, uploadedFilename);
				f.delete();

				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
				return entity;
			}

			entity = new ResponseEntity<String>(uploadedFilename, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/uploadajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;

		try {
			MultipartFile file = request.getFile("file");
			String originalName = file.getOriginalFilename();
			String uploadpath = ctx.getRealPath(this.productupload);

			String uploadedFilename = UploadUtils.uploadFile(file, originalName, uploadpath);
			
			
			entity = new ResponseEntity<String>(uploadedFilename, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	@RequestMapping(value = "/displayfile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayfile(String filename){
		ResponseEntity<byte[]> entity = null;
		
		InputStream in = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			String uploadpath = ctx.getRealPath(this.productupload);
			in = new FileInputStream(new File(uploadpath,filename));
			
			String formatName = UploadUtils.getFormatName(filename);
			MediaType mType = UploadUtils.getMediaType(formatName);
			
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	@RequestMapping(value = "/deletefile", method = RequestMethod.POST)
	public ResponseEntity<String> deletefile(String filename) {
		ResponseEntity<String> entity = null;
		String uploadpath = ctx.getRealPath(this.productupload);
		filename.replace('/', File.separatorChar);

		try {
			String formatName = UploadUtils.getFormatName(filename);
			MediaType mType = UploadUtils.getMediaType(formatName);
			if (mType != null) {

				String originalImageFilename = UploadUtils.getOriginalImageFilename(filename);
				File f2 = new File(uploadpath, originalImageFilename);
				f2.delete();
			}

			File f = new File(uploadpath, filename);
			f.delete();

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	
	
	@RequestMapping(value = "/getAttach/{pid}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getAttach(@PathVariable("pid") String pid) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<String> list = aService.getAttach(pid);
			map.put(pid, list);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	@RequestMapping(value = "/getAttach2/{pid}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getAttach2(@PathVariable("pid") String pid) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<String> list = aService.getAttach(pid);
			String pnamelist = aService.pname(pid);
			
			map.put(pid, list);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put(pnamelist, map);
			
			entity = new ResponseEntity<Map<String, Object>>(map2, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/deletefileNdb", method = RequestMethod.POST)
	public ResponseEntity<String> deletefileNdb(String filename) {
		ResponseEntity<String> entity = null;
		String uploadpath = ctx.getRealPath(this.productupload);
		filename.replace('/', File.separatorChar);

		try {

			int result = aService.deleteFileByFilename(filename);

			if (result == 0) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
				return entity;
			}

			String formatName = UploadUtils.getFormatName(filename);
			MediaType mType = UploadUtils.getMediaType(formatName);
			if (mType != null) {

				String originalImageFilename = UploadUtils.getOriginalImageFilename(filename);
				File f2 = new File(uploadpath, originalImageFilename);
				f2.delete();
			}

			File f = new File(uploadpath, filename);
			f.delete();

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	
}
