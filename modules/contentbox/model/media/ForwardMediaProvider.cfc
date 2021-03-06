/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp] 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at 

http://www.apache.org/licenses/LICENSE-2.0 

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.
********************************************************************************
* Deliver file via pagecontext forward
*/
component accessors="true" implements="contentbox.model.media.IMediaProvider" singleton{
	
	// Dependecnies
	property name="mediaService"		inject="mediaService@cb";
	property name="log"					inject="logbox:logger:{this}";
	property name="fileUtils" 			inject="coldbox:plugin:FileUtils";
	
	/**
	* Constructor
	*/
	any function init(){
		return this;
	}
	
	/**
	* The internal name of the provider
	*/
	function getName(){
		return "ForwardMediaProvider";
	}
	
	/**
	* Get the display name of a provider
	*/
	function getDisplayName(){
		return "Forward Media Provider";
	}
	
	/**
	* Get the description of this provider
	*/
	function getDescription(){
		return "This provider will forward to the real physical location in the server for the media path requested via the internal servlet
		page context, so no real media path URL will be shown to the user. Use only if the media root is web accessible and a relative web root path, so double check your media root.";
	}
	
	/**
	* Validate if a media requested exists
	* @mediaPath.hint the media path to verify if it exists
	*/
	boolean function mediaExists(required mediaPath){
		return fileExists( getRealMediaPath( arguments.mediaPath ) );
	}
	
	/**
	* Deliver the media
	* @mediaPath.hint the media path to deliver back to the user
	*/
	any function deliverMedia(required mediaPath){
		// get the real path
		var realPath =  mediaService.getCoreMediaRoot() & "/" & arguments.mediaPath;
		// relocate to it
		getPageContext().forward( realPath );abort;
		// abort so CF does not choke.
		abort;
	}
	
	/************************************** PRIVATE *********************************************/
	
	private function getRealMediaPath(required mediaPath){
		return mediaService.getCoreMediaRoot( absolute=true ) & "/#arguments.mediaPath#";
	}
	
}