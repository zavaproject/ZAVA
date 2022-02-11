package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadUtils {

	public static String uploadFile(MultipartFile file, String originalFileName, String uploadpath) throws Exception {
		// TODO Auto-generated method stub

		String uploadedFilename = null;

		String datePath = calData(uploadpath);
		String savedName = getSystemFilename(originalFileName);

		File target = new File(uploadpath+datePath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);

		String formatName = getFormatName(originalFileName);
		MediaType mType = getMediaType(formatName);

		if (mType != null) {

			uploadedFilename = makeThumbnail(uploadpath, datePath, savedName);

		} else {
			uploadedFilename = makeInconInfo(datePath, savedName);
		}

		return uploadedFilename;
	}

	private static String makeThumbnail(String uploadpath, String datePath, String savedName) throws Exception {
		// TODO Auto-generated method stub
		File srcFile = new File(uploadpath + datePath, savedName);

		BufferedImage sourceImg = ImageIO.read(srcFile);

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 200);
		
		String thumbnailName = datePath + File.separator + "s_" + savedName;
		File newFile= new File(uploadpath,thumbnailName);
		
		String formatName = getFormatName(savedName);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.replace(File.separatorChar, '/');
	}

	private static String makeInconInfo(String datePath, String savedName) {
		// TODO Auto-generated method stub
		String inconInfo = datePath + File.separator + savedName;

		inconInfo = inconInfo.replace(File.separatorChar, '/');

		return inconInfo;
	}

	public static MediaType getMediaType(String formatName) {
		// TODO Auto-generated method stub
		Map<String, MediaType> mediaMap = new HashMap<String, MediaType>();

		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);

		formatName = formatName.toUpperCase();

		MediaType mediaType = mediaMap.get(formatName);

		return mediaType;
	}

	public static String getFormatName(String filename) {
		// TODO Auto-generated method stub
		int idx = filename.lastIndexOf(".");
		String formatName = filename.substring(idx + 1);

		return formatName;
	}

	public static void makeDir(String uploadpath, String yearPath, String monthPath, String datePath) {
		// TODO Auto-generated method stub
		File f1 = new File(uploadpath, datePath);
		if (f1.exists()) {
			return;
		} else {
			File fyear = new File(uploadpath, yearPath);
			if (!fyear.exists()) {
				fyear.mkdir();
			}
			File fmonth = new File(uploadpath, monthPath);
			if (!fmonth.exists()) {
				fmonth.mkdir();
			}
			File fdate = new File(uploadpath, datePath);
			if (!fdate.exists()) {
				fdate.mkdir();
			}
		}

	}

	public static String calData(String uploadpath) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		String yearPath = File.separator + year;

		int month = cal.get(Calendar.MONTH)+1;
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(month);

		int date = cal.get(Calendar.DATE);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(date);

		makeDir(uploadpath, yearPath, monthPath, datePath);

		return datePath;
	}

	public static String getSystemFilename(String originalFileName) {

		UUID uid = UUID.randomUUID();

		return uid.toString() + "_" + originalFileName;
	}

	public static String getOriginalImageFilename(String filename) {
		String prefix = filename.substring(0, 12);
		String suffix = filename.substring(14);
		return prefix+suffix;
	}
	
}
