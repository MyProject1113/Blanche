package com.blanche.board.ckediter;

import java.util.ArrayList;
import java.util.List;

import com.ckeditor.CKEditorConfig;
import com.ckeditor.EventHandler;
import com.ckeditor.GlobalEventHandler;

public class ConfigurationHelper {
	public static CKEditorConfig createConfig() {
		CKEditorConfig config = new CKEditorConfig();
		List<List<String>> list = new ArrayList<List<String>>();
		List<String> subList = null;
		
		subList = new ArrayList<String>();
		subList.add("Source");
		subList.add("Maximize");
		list.add(subList);
		
		subList = new ArrayList<String>();
		subList.add("Bold");
		subList.add("Italic");
		subList.add("Underline");
		subList.add("Strike");
		list.add(subList);
		
		subList = new ArrayList<String>();
		subList.add("Cut");
		subList.add("Copy");
		subList.add("Past");
		subList.add("-");
		subList.add("Find");
		subList.add("Replace");
		subList.add("Undo");
		subList.add("Redo");
		list.add(subList);
		
		subList = new ArrayList<String>();
		subList.add("Image");
		subList.add("Link");
		subList.add("Unlink");
		subList.add("Flash");
		list.add(subList);
		
		config.addConfigValue("toolbar", list);
		config.addConfigValue("height", 400);
		config.addConfigValue("filebrowserImageUploadUrl", "/board/attach/upload.do");
		config.addConfigValue("image_previewText", " ");
		return config;
	}
	
	public static EventHandler createEventHandlers() {
		EventHandler handler = new EventHandler();
		handler.addEventHandler("instanceReady","function (ev) { alert(\"Loaded: \" + ev.editor.name); }");
		return handler;
	}
	
	public static GlobalEventHandler createGlobalEventHandlers() {
		GlobalEventHandler handler = new GlobalEventHandler();
		handler.addEventHandler("dialogDefinition","function (ev) {  alert(\"Loading dialog window: \" + ev.data.name); }");
		return handler;
	}
}