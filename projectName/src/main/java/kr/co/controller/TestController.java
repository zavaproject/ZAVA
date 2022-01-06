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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.AttachService;
import kr.co.service.TestService;
import kr.co.utils.UploadUtils;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private AttachService aService;

	@Inject
	private ServletContext ctx;

	@Resource(name = "uploadpath")
	private String uploadpath;

	@Inject
	private TestService tService;
	
	
	
	@RequestMapping(value = "/inter", method = RequestMethod.GET)
	public void interGet(Model model) {
		
		model.addAttribute("hello", "world");
		model.addAttribute("tService", tService);
		
		System.out.println("TestController의 inter Get");
	}
	
	
	
	
	@RequestMapping(value = "/inter", method = RequestMethod.POST)
	public void interPOST() {
		System.out.println("TestController의 inter POST");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

	@RequestMapping(value = "/aop1", method = RequestMethod.GET)
	public void aop1() {
		tService.test1();
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "/uploadForm2", method = RequestMethod.POST)
	public void uploadForm(MultipartHttpServletRequest request) throws Exception {
		String uploadpath = ctx.getRealPath(this.uploadpath);

		String id = request.getParameter("id");
		MultipartFile file = request.getFile("file");

		String originalFilename = file.getOriginalFilename();

		UploadUtils.uploadFile(file, originalFilename, uploadpath);

	}

//	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//	public void uploadForm(MultipartFile file, String id) {
//		System.out.println(id);
//		String originalFilename = file.getOriginalFilename();
//		long size = file.getSize();
//		String contentType = file.getContentType();
//		
//		System.out.println(originalFilename+" : "+size+" : "+contentType);
//		
//	}

	@RequestMapping(value = "/uploadiframe", method = RequestMethod.GET)
	public void uploadiframe() {
	}

	@RequestMapping(value = "/uploadiframe2", method = RequestMethod.POST)
	public String uploadiframe2(MultipartHttpServletRequest request) throws Exception {

		String uploadpath = ctx.getRealPath(this.uploadpath);
		MultipartFile file = request.getFile("file");
		String originalFilename = file.getOriginalFilename();

		String savedName = UploadUtils.uploadFile(file, originalFilename, uploadpath);

		return "test/uploadiframeResult";
	}

	@RequestMapping(value = "/uploadajax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	@RequestMapping(value = "/uploadajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;
		
		try {
			MultipartFile file = request.getFile("file");
			String originalName = file.getOriginalFilename();
			String uploadpath = ctx.getRealPath(this.uploadpath);

			String uploadedFilename = UploadUtils.uploadFile(file, originalName, uploadpath);
			entity = new ResponseEntity<String>(uploadedFilename, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	
	
	
	
	@RequestMapping(value = "/uploadajax2", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax2(MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;
		
		try {
			MultipartFile file = request.getFile("file");
			String filename = request.getParameter("filename");
			String uploadpath = ctx.getRealPath(this.uploadpath);

			String uploadedFilename = UploadUtils.uploadFile2(file, filename, uploadpath);
			entity = new ResponseEntity<String>(uploadedFilename, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	@RequestMapping(value = "/displayfile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayfile(String filename) {
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;

		try {
			HttpHeaders headers = new HttpHeaders();

			String uploadpath = ctx.getRealPath(this.uploadpath);

			in = new FileInputStream(new File(uploadpath, filename));

			String formatName = UploadUtils.getFormatName(filename);
			MediaType mType = UploadUtils.getMediaType(formatName);

			headers.setContentType(mType);

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
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

	@RequestMapping(value = "/downloadorshow", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downloadorshow(String linkurl) {
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;

		try {
			HttpHeaders headers = new HttpHeaders();

			String uploadpath = ctx.getRealPath(this.uploadpath);

			in = new FileInputStream(new File(uploadpath, linkurl));

			String formatName = UploadUtils.getFormatName(linkurl);
			MediaType mType = UploadUtils.getMediaType(formatName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

				int idx = linkurl.indexOf("_");
				String filename = linkurl.substring(idx + 1);
				String str = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
				headers.add("Content-Disposition", "attachment;filename=\"" + str + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
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
		String uploadpath = ctx.getRealPath(this.uploadpath);
		filename = filename.replace('/', File.separatorChar);
		

		try {
			
			String formatName = UploadUtils.getFormatName(filename);
			MediaType mType = UploadUtils.getMediaType(formatName);
			if (mType != null) {

				String originalImageFilename = UploadUtils.getOriginalImageFilename(filename);
				File f2 = new File(uploadpath, originalImageFilename);
				f2.delete();
				
				Thread.sleep(10);
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

	@RequestMapping(value = "/getAttach/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getAttach(@PathVariable("bno") int bno) {
		ResponseEntity<List<String>> entity = null;

		try {
			List<String> list = aService.getAttach(bno);
			entity = new ResponseEntity<List<String>>(list, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/deletefileNdb", method = RequestMethod.POST)
	public ResponseEntity<String> deletefileNdb(String filename) {
		ResponseEntity<String> entity = null;
		String uploadpath = ctx.getRealPath(this.uploadpath);
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

	@RequestMapping(value = "/uploadajaxNdb/{bno}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadajaxNdb(@PathVariable("bno") int bno, MultipartHttpServletRequest request) {

		ResponseEntity<String> entity = null;

		try {
			MultipartFile file = request.getFile("file");
			String originalName = file.getOriginalFilename();
			String uploadpath = ctx.getRealPath(this.uploadpath);

			String uploadedFilename = UploadUtils.uploadFile(file, originalName, uploadpath);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bno", bno);
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

	@RequestMapping(value = "/testajax", method = RequestMethod.GET)
	public void testajax() {

	}

	@RequestMapping(value = "/test1", method = RequestMethod.POST)
	public ResponseEntity<String> test1(String text) {

		ResponseEntity<String> entity = new ResponseEntity<String>(text, HttpStatus.OK);
		return entity;

	}

	@RequestMapping(value = "/test2", method = RequestMethod.POST)
	public ResponseEntity<String> test2(String result) {

		ResponseEntity<String> entity = new ResponseEntity<String>(result.substring(1), HttpStatus.OK);
		return entity;

	}
	
	
}
