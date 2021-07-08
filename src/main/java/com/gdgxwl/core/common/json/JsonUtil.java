package com.gdgxwl.core.common.json;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;
import com.gdgxwl.core.common.AjaxUtils;
import org.apache.commons.lang3.StringUtils;


import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Map;

public class JsonUtil {

	public static void writeJson(ServletRequest request,
			ServletResponse response, Object obj) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonGenerator jsonGenerator = objectMapper.getJsonFactory()
				.createJsonGenerator(response.getOutputStream(),
						JsonEncoding.UTF8);
		HttpServletRequest req = (HttpServletRequest) request;
		if (AjaxUtils.isAjaxRequest(req)) {
			response.setContentType("application/json;charset=UTF-8");
		} else {
			response.setContentType("text/html;charset=UTF-8");
		}
		jsonGenerator.writeObject(obj);
	}

	public static String toJsonString(Object obj) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.writeValueAsString(obj);
	}

	public static String toJsonString(Object obj, String properties)
			throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();

		SimpleFilterProvider filter = new SimpleFilterProvider();
		filter.addFilter("propertiesFilter", SimpleBeanPropertyFilter
				.serializeAllExcept(StringUtils.split(properties, ",")));

		return objectMapper.writer(filter).writeValueAsString(obj);
	}

	public static String toJsonString(Object obj, String properties,
			boolean include) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();

		SimpleFilterProvider filter = new SimpleFilterProvider();
		if (!include) {
			return toJsonString(objectMapper, properties);
		}
		filter.addFilter("propertiesFilter", SimpleBeanPropertyFilter
				.filterOutAllExcept(StringUtils.split(properties, ",")));

		return objectMapper.writer(filter).writeValueAsString(obj);
	}

	public static Map<String, Object> parseValue(String msg) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.readValue(msg, new TypeReference<Map<String, Object>>() {});
	}

	public static <T> T parseValue(String msg, Class<T> clazz)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		return objectMapper.readValue(msg, clazz);
	}

	public static <T> T parseValue(String msg, TypeReference<T> valueTypeRef) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			return objectMapper.readValue(msg, valueTypeRef);
		} catch (JsonParseException e) {
			e.printStackTrace();
			return null;
		} catch (JsonMappingException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static <T> T parseValue(File src, TypeReference<T> valueTypeRef) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			return objectMapper.readValue(src, valueTypeRef);
		} catch (JsonParseException e) {
			e.printStackTrace();
			return null;
		} catch (JsonMappingException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void writeJson(File file,Object obj) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
//		JsonGenerator jsonGenerator = objectMapper.getJsonFactory()
//				.createJsonGenerator(file,JsonEncoding.UTF8);
//		jsonGenerator.writeObject(obj);
//		jsonGenerator.flush();
//		jsonGenerator.close();
//		jsonGenerator=null;
	}


}
