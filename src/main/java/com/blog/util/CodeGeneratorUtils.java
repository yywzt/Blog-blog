package com.blog.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.blog.common.config.GlobalConstants;

/**
 * 编码生成器，生成用户编码，部门编码，公司编码，用户密码等
 * @author hanyt
 * 2017-05-11
 */
public class CodeGeneratorUtils {
	
	
	private static MessageDigest md5 = null;
	
	private static MessageDigest getMD5(String algorithm) throws NoSuchAlgorithmException{
		if(md5 == null)
			md5 = MessageDigest.getInstance(algorithm);
		return md5;
	}
	
	/**
	 * 生成密码密文
	 * @param password 明文密码
	 * @return
	 */
	public static String generalPasw(String password){
		if(password == null)
			password = "";
		String result = password;
		try {
			MessageDigest md5 = getMD5(GlobalConstants.GLORITHM);
			md5.update(password.getBytes(GlobalConstants.CHARSET_NAME));
			//生成密文
			byte[] encryByte = md5.digest();
			//将字节转换成16进制输出
			StringBuffer strBuf = new StringBuffer();
			for(int i=0;i<encryByte.length;i++){
				if(Integer.toHexString(0xFF & encryByte[i]).length() == 1){
					strBuf.append("0").append(Integer.toHexString(0xFF & encryByte[i]));
				}else{
					strBuf.append(Integer.toHexString(0xFF & encryByte[i]));
				}
			}
			result = strBuf.toString();
		} catch (NoSuchAlgorithmException e) {
			//log.error("使用SHA方式加密时出错\n"+e.getMessage());
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			//log.error("使用SHA方式加密时出错\n"+e.getMessage());
			e.printStackTrace();
			
		}
		return result;
		
	}
	
	/**
	 * 生成密码密文
	 * @param password 明文密码
	 * @param algorithm 加密方式 支持SHA,MD5
	 * @return
	 */
	public static String generalPasw(String password,String algorithm){
		if(password == null)
			password = "";
		if(StringUtils.isEmpty(algorithm)){
			algorithm = GlobalConstants.GLORITHM;
		}
		String result = password;
		try {
			MessageDigest md5 = getMD5(algorithm);
			md5.update(password.getBytes(GlobalConstants.CHARSET_NAME));
			//生成密文
			byte[] encryByte = md5.digest();
			//将字节转换成16进制输出
			StringBuffer strBuf = new StringBuffer();
			for(int i=0;i<encryByte.length;i++){
				if(Integer.toHexString(0xFF & encryByte[i]).length() == 1){
					strBuf.append("0").append(Integer.toHexString(0xFF & encryByte[i]));
				}else{
					strBuf.append(Integer.toHexString(0xFF & encryByte[i]));
				}
			}
			result = strBuf.toString();
		} catch (NoSuchAlgorithmException e) {
			//log.error("使用SHA方式加密时出错\n"+e.getMessage());
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			//log.error("使用SHA方式加密时出错\n"+e.getMessage());
			e.printStackTrace();
			
		}
		return result;
	}
	
}
