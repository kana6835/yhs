/* 
 * 공통 스크립트
 * 작성자: 유현상
 * 2018-11-01 : v0.1
 * 수정이력 :  
 */
$(function() {
	if($(".emptyBody").length > 0){
		$(".emptyBody").siblings().hide();
		$("tr.emptyBody td").css("text-align","center");
		$("tr.emptyBody td").attr("colspan",$(".emptyBody").siblings().children().length);
	}

	$.fn._serializeJsonObject = function() {
	    var obj = {};
	    try{
	        $(this).find("input,select,textarea").each(function(){	        	
	        	obj[this.name] = $(this).val();
	        });
	    }catch(e){
	        console.log(e.message);
	    }finally{
	    	
	    }
    	return obj;
	}
	
	$.fn._serializeJsonArray = function() {
	    var obj = {};
	    var objArray = new Array(); 
	    try{
	    	var startKey = null;
	        $(this).find("input,select,textarea").each(function(){	        	
	        	if(this.name == startKey){
	        		objArray.push(obj);
	        		obj = {};
	        	}
	        	if(startKey == null){
	        		startKey = this.name;
	        	}
	        	obj[this.name] = $(this).val();
	        });
	        objArray.push(obj);
	    }catch(e){
	        console.log(e.message);
	    }finally{
	    	
	    }
    	return JSON.stringify(objArray);	    
	}
	
	$.fn._loopData = function(d,o){
		if($(this).find(".emptyBody").length == 1){
			$(this).data("$emptyBody",$(this).find(".emptyBody"));
			$(this).find(".emptyBody").remove();
		}
		var $this = $(this);
		if($this.data("oriHtml") == undefined){
			$this.data("oriHtml",$this.html());
			var oeh = $this.html();
			if(oeh.match(/#/g)||[].length % 2 == 0){
				while(oeh.indexOf("#") >= 0){
					var removeMap = oeh.substr(oeh.indexOf("#"),(oeh.indexOf("#",oeh.indexOf("#")+1) -oeh.indexOf("#")+1));
					oeh = oeh.split(removeMap).join("");
				}
				$this.data("oriEmptyHtml",oeh);
			}
		}
		$this.empty();
		$this.data("oriData",d);
		$(d).each(function(i){
			var h = $this.data("oriHtml");
			$.each(this,function(key,value){
				value = value||""; 
				if(o != null && o[key] != null && typeof(o[key]) == "function"){
					h = h.split("#"+key+"#").join(o[key](value));
				}else{
					h = h.split("#"+key+"#").join(value);
				}
			});
			$this.append(h).children(":last").data(this).data("changeYn","N").change(function(){
				$(this).data("changeYn","Y");
				$(this).find("input[name='changeYn']").remove();
				$(this).append("<input  type='hidden' name='changeYn' value ='Y'>");
			});
			
		});
		$this.children().show();
		if(d == null || d.length < 1){
			$(this).append($(this).data("$emptyBody"));
		}
		if(d.param != null && d.param.pagingDiv != null && d.totalCnt != null){
			var dp = d.param;
			$("#"+ dp.pagingDiv).html(_paging(d.totalCnt,dp.dataSize||10,dp.pageSize||10,dp.pageNo||1));
			$("#"+ dp.pagingDiv).find("a,button").click(function(){
				dp.pageNo = $(this).attr("page");
				$this._loopData(_ajax(d.url,dp).rd,o);
			});
		}
	}
	
	$.fn._appendEmptyForm = function(){
		$(this).append($(this).data("oriEmptyHtml"));
		$(this).children(":last").show();
		if($(this).is("tbody")){
			$(this).closest("table").find(".emptyBody").remove();
		}
	}								
	
	$.fn._empty = function(){
		var oeh = $(this).html();
		$(this).data("oriHtml",oeh);
		if(oeh.match(/#/g)||[].length % 2 == 0){
			while(oeh.indexOf("#") >= 0){
				var removeMap = oeh.substr(oeh.indexOf("#"),(oeh.indexOf("#",oeh.indexOf("#")+1) -oeh.indexOf("#")+1));
				oeh = oeh.split(removeMap).join("");
			}
			$(this).html(oeh);
		}
	}
	
	$.fn._excelDown = function(SaveFileName){
		if($(this).find("tbody tr").length == 0 
				|| $(this).find("tbody tr td :eq(0)").attr("colspan") > 0
				|| ($(this).find("tbody tr").length == 1 && $(this).find("tbody tr").css("display") == "none")){
			alert("조회된 데이터가 존재하지 않습니다.");
			return;
		}
	    if (!SaveFileName) {
	        SaveFileName = $("title").text();
	    }
		var agent = navigator.userAgent.toLowerCase();
		if (agent.indexOf(".net") == -1) {
			var a = document.createElement('a');
	        var data_type = 'data:application/vnd.ms-excel';
	        var style = $("style").clone().wrapAll("<style/>").parent().html();
	        var table_div = $(this).clone().wrapAll("<table/>").parent().html();
	        var table_html = encodeURIComponent(style+table_div);
	        a.href = data_type + ', ' + table_html;
	        a.download = SaveFileName + '.xls';
	        a.click();
		}else{
		    if (document.all.excelExportFrame == null){
		        var ef = document.createElement("iframe");
		        ef.id = "excelExportFrame";
		        ef.name = "excelExportFrame";
		        ef.position = "absolute";
		        ef.style.zIndex = -1;
		        ef.style.visibility = "hidden";
		        ef.style.top = "-10px";
		        ef.style.left = "-10px";
		        ef.style.height = "0px";
		        ef.style.width = "0px";
		        document.body.appendChild(ef); 
		    }
		    var ft = document.all.excelExportFrame.contentWindow.document; 
		    ft.open("text/html", "replace");
		    ft.write('<html>');
		    ft.write('<meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=euc-kr"/>\r\n');
		    ft.write($("style").clone().wrapAll("<style/>").parent().html());
		    ft.write('<body onload="saveFile();">');
		    ft.write($(this).clone().wrapAll("<table/>").parent().html()); 
		    ft.write('<script language="javascript">');
		    ft.write('function saveFile(){document.execCommand("SaveAs", true, "'+ ( SaveFileName  + ".xls" )+ '");}');
		    ft.write('<\/script>');
		    ft.write('</body>');
		    ft.write('</html>');
		    ft.charset="UTF-8";
		    ft.close();
		}
	}
	
	$.fn._fileUpload = function(o){
		var init = {
			uploadPath : ""
			,fileName	: null
			,fileEx 		: null
			,fileSize		: 5
		}
		var f = $.extend({},init,o||{});
		var r;
		var d = new FormData();
		var fileX = $(this).length;
		for (var i = 0; i < fileX; i++) {
			var fileY = $(this).get(i).files.length;
			if(fileY == 0){
				alert("선택된 파일이 없습니다.");
				return;
			}
			for (var j = 0; j < fileY; j++) {
				var _file =  $(this)[i].files[j];
				if(f.fileEx != null && f.fileEx.indexOf(_file.name.substring(_file.name.lastIndexOf(".")+1)) < 0 ){
					alert("[" + f.fileEx + "] 확장자만 업로드 가능합니다.");
					return;
				}
				if((parseInt(f.fileSize) * 1024 * 1024) < _file.size){
					alert("첨부파일 용량은 " + f.fileSize + "MB내로만 등록 가능합니다.");
					return;
				}
				d.append("file", _file);
			}
			d.append("fileName", f.fileName||_file.name.substring(0,_file.name.lastIndexOf(".")));
			d.append("uploadPath",f.uploadPath);
		}
		$.ajax({
			async:false,
			data:d,
			url:"/SSFA/fileUpload.do",
			type:"POST",
			processData : false,
			contentType : false,
			success:function(data){
				if(data.rc){
					alert("업로드 성공");
					r = data;
				}else{
					alert("Error = " + data.rm);
					return;
				}
			}
		});
		return r;
	}
});

var _getCode = {
		init : {
			data 		: {}
			,class 	: ""
			,id			: ""
			,name	: ""
			,value	: ""
			,addEmpty : false
			,addEmptyTxt : ""
			,returnType	: "html" 	
		},
		getData : function(o){
			try{
				return _ajax("/SSFA/getCode.do",o).rd;
			}catch (e) {
				this.error(e);
			}
		},
		getSelectBox : function(o){
			try{
				var d = $.extend({},this.init,o);
				var sel = "<select class='"+d.class+"' id='"+d.id+"' name='"+d.name+"'>";
				var st = "selected='selected'";
				if(d.addEmpty){
					sel += "<option value = ''>"+d.addEmptyTxt+"</option>";
				}	
				$(d.data).each(function(){
					sel += "<option value = '"+this.CODENO+"' "+ (d.value == this.CODENO ? st : "") + ">"+ this.CODENAME + "</option>";				
				})	;
				sel += "</select>";
				if(d.returnType == "html"){
					return $(sel).clone().wrapAll("<select/>").parent().html(); 
				}else if(d.returnType == "obj"){
					return $(sel);
				}
			}catch (e) {
				this.error(e);
			}
		},
		error : function(e){
			console.log(e.message);
			return "";
		}
}

$.ajaxSetup({
	beforeSend : function(xmlHttpRequest){
        xmlHttpRequest.setRequestHeader("ajax", "true");
	},
	error : function(xhr, textStatus, error){
		if(xhr.status == 401){
			alert("세션이 만료되어 로그아웃 되었습니다.");
			location.href = "/SSFA/login/login.do";
		}
	},
	contentType:"application/x-www-form-urlencoded; charset=UTF-8"
});

var _ajax = function(u,d){
	var r;
	try{
		if(d.pagingDiv != null){
			d.dataSize = d.dataSize == null ? 10 : parseInt(d.dataSize);
			d.pagingSt = (d.pageNo == undefined || d.pageNo == 1 ? 1 : (d.pageNo * d.dataSize) + 1);
			d.pagingEd = (d.pageNo == undefined || d.pageNo == 1 ? d.dataSize : (d.pageNo * d.dataSize) + d.dataSize);
		}
	}catch (e) {
	}
	$.ajax({
		async:false,
		data:d,
		url:u,
		type:"POST",
		success:function(data){
			r = data;
			try{
				r.rd["param"] = d;
				r.rd["url"] = u;
				r.rd["totalCnt"] = r.totalCnt;
				r["param"] = d;
				r["url"] = u;
			}catch(e){
				
		    }
		}
	});   
	return r;
}

var _pad = function(n, width) {
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

var _getTodayDate = function(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate();
	var zeroNN = function (number){
		var num = String(number);
		if(num.length==1){num = "0"+num;}
		return num;
	}
	
	month = zeroNN(month+1);
	day = zeroNN(day);
	
	return year+"-"+month+"-"+day;
}

var _paging = function(totalCnt, dataSize, pageSize, pageNo){ 
	totalCnt = parseInt(totalCnt); 
	dataSize = parseInt(dataSize); 
	pageSize = parseInt(pageSize); 
	pageNo = parseInt(pageNo); 
	
	var html = new Array(); 
	if(totalCnt == 0 || dataSize >= totalCnt){
		return ""; 
	} 
	var pageCnt = totalCnt % dataSize; 
/*	if(pageCnt == 0){ 
		pageCnt = parseInt(totalCnt / dataSize); 
	}else{
		pageCnt = parseInt(totalCnt / dataSize) + 1; 
	} */
	pageCnt = parseInt(totalCnt / dataSize); 
	var pRCnt = parseInt(pageNo / pageSize); 
	if(pageNo % pageSize == 0){
		pRCnt = parseInt(pageNo / pageSize) - 1; 
	} //이전 화살표 
	if(pageNo > pageSize){ 
		var s2; 
		if(pageNo % pageSize == 0){
			s2 = pageNo - pageSize; 
		}else{ 
			s2 = pageNo - pageNo % pageSize; 
		} 
		html.push('<button page= "1">처음 </button>');
		html.push('<button page= "'+s2+'">이전</button>'); 
	}
	/*else{ 
		html.push('<a href="#">\n'); 
		html.push('◀'); 
		html.push('</a>'); 
	}*/
	//paging Bar
	for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){
		if(index > totalCnt){
			return html.join("");
		}
		if(index == pageNo){ html.push('<strong>'); 
			html.push(index); html.push('</strong>'); 
		}else{ 
			html.push('<a page= "'+index+'">'+index+'</a>'); 
		} 
		if(index == pageCnt){ 
			break; 
		}else html.push('|'); 
	} //다음 화살표 
	if(pageCnt > (pRCnt + 1) * pageSize){
		html.push('<button page= "'+((pRCnt + 1)*pageSize+1)+'">다음</button>');
		html.push('<button page= "'+pageCnt+'">마지막</button>');
	}
	/*else{ 
		html.push('<a href="#">'); 
		html.push('▶'); 
		html.push('</a>'); 
	}*/ 
	return html.join(""); 
}

