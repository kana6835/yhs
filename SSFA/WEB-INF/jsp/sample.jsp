<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SALES SFA : samplePage</title>
<style type="text/css">
	html {
		font-size: 11px;
	}	
	.group {
		background-color: yellow;
		width: 15%;
		font-weight: bold;
	}
	table {
		width: 70%;
		border: 1px solid #444444;
		border-collapse: collapse;
	}
	td,th {
		border: 1px solid #444444;
		border-collapse: collapse;
	}
	#paging {
		margin-left: 30%;
	}
	img {
		width: 200px;
	}
</style>
</head>
<body>

<div class="group">WBS</div>
<p>
<button id="add_wbs_form">WBS 추가</button>
<button id="wbs_multi_insert">WBS 저장</button>
<p>
<table id = "wbs_table">
	<thead>
		<tr>
			<th>저장</th>
			<th>프로젝트</th>
			<th>화면명</th>
			<th>퍼블리셔</th>
			<th>퍼블진행도</th>
			<th>퍼블시작일</th>
			<th>퍼블완료예정일</th>
			<th>퍼블완료일</th>
			<th>퍼블URL</th>
			<th>디자이너</th>			
			<th>디자인진행도</th>
			<th>디자인시작일</th>
			<th>디자완료예정일</th>
			<th>디자완료일</th>
			<th>디자인URL</th>
			<th>개발자</th>
			<th>개발진행도</th>
			<th>개발시작일</th>
			<th>개발완료예정일</th>
			<th>개발완료일</th>
			<th>개발URL</th>
			<th>테스트</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody id="wbs_tbody"> 
		<tr>
			<td><button class = "wbs_single_insert">저장</button></td>
			<td><input name ="JOBCATENM" value= "#JOBCATENM#"><input type = "hidden" name ="JOBCATECD" value= "0001"></td>
			<td><input name ="JOBNM" value= "#JOBNM#"><input type = "hidden" name ="JOBCD" value= "01"></td>			
			<td><input name ="PUBLISH_NM" value= "#PUBLISH_NM#"></td>
			<td><input name ="PUBLISH_PROGRESS" value= "#PUBLISH_PROGRESS#"></td>
			<td><input name ="PUBLISH_START_DT" value= "#PUBLISH_START_DT#"></td>			
			<td><input name ="PUBLISH_TARGET_DT" value= "#PUBLISH_TARGET_DT#"></td>
			<td><input name ="PUBLISH_COMP_DT" value= "#PUBLISH_COMP_DT#"></td>
			<td><input name ="PUBLISH_URL" value= "#PUBLISH_URL#"></td>
			<td><input name ="DISIGN_NM" value= "#DISIGN_NM#"></td>
			<td><input name ="DISIGN_PROGRESS" value= "#DISIGN_PROGRESS#"></td>
			<td><input name ="DISIGN_START_DT" value= "#DISIGN_START_DT#"></td>			
			<td><input name ="DISIGN_TARGET_DT" value= "#DISIGN_TARGET_DT#"></td>
			<td><input name ="DISIGN_COMP_DT" value= "#DISIGN_COMP_DT#"></td>
			<td><input name ="DISIGN_URL" value= "#DISIGN_URL#"></td>
			<td><input name ="DEV_NM" value= "#DEV_NM#"></td>
			<td><input name ="DEV_PROGRESS" value= "#DEV_PROGRESS#"></td>
			<td><input name ="DEV_START_DT" value= "#DEV_START_DT#"></td>			
			<td><input name ="DEV_TARGET_DT" value= "#DEV_TARGET_DT#"></td>
			<td><input name ="DEV_COMP_DT" value= "#DEV_COMP_DT#"></td>
			<td><input name ="DEV_URL" value= "#DEV_URL#"></td>
			<td><input name ="TEST_YN" value= "#TEST_YN#"></td>
			<td><input name ="BIGO" value= "#BIGO#"></td>
		</tr>
		<tr class="emptyBody"><td>조회된 데이터가 없습니다.</td></tr>
	</tbody>
</table>





<p>
<!-- 테이블 루프 -->
<!-- 테이블 루프 -->
<div class="group">_loopData TABLE</div>
<p>
<button id="search_TABLE">조회</button>
<button id="del_TABLE">삭제</button>


<table>
	<thead>
		<tr>
			<th>컬럼A</th>
			<th>컬럼B</th>
			<th>컬럼C</th>
			<th>컬럼D</th>
			<th>컬럼E</th>
			<th>컬럼F</th>
			<th>컬럼G</th>
			<th>컬럼H</th>
		</tr>
	</thead>
	<tbody id="sampleLoop_TABLE"> 
	<!-- ajax 결과 json과 매핑하여 반복 출력할 html 의 부모노드에 아이디 지정(아이디가 없어도 선택할 수 만 있으면 됨) -->		
		<tr>
			<td>#FAXNO2#</td>
			<!-- json의 결과key 에 ## 를 더하면 매핑됨 -->
			<td><input type="text" value="#FAXNO3#"></td>
			<!-- attribute 값이어도 매핑이됨 -->
			<td>#SMSNMSRV#</td>
			<td>#BIGO#</td>
			<td>#BRANDCD#</td>
			<!-- selectbox 추가시 -->
			<td>#PRESIDENTNM#</td>
			<td>#USEYN#</td>
			<!-- checkbox 추가시 -->
			<td>#ADDRESS1#</td>
		</tr>
		<tr class="emptyBody"><td>조회된 데이터가 없습니다.</td></tr>
		<!-- emptyBody 클래스가 존재한다면 형제 노드는 자동 히든 처리됨  tr 노드일경우  colspan은 자동으로 맞춰짐	
			data length가 0일경우  emptyBody 가 출력됨.
			emptyBody가 없을경우는   #KEY# 가 그대로 노출되니 히든처리 해야함 또는 $("sampleLoop_TABLE")._empty() 를 사용해도됨
			노드가 hide()돼있더라도 _loopData 호출시 block 처리됨
		-->
	</tbody>
</table>










<p>
<!-- 유엘 루프 -->
<!-- 유엘 루프 -->
<div class="group">_loopData UL</div>
<p>
<button id="search_Ul">조회</button>
<button id="del_Ul">삭제</button>


<ul id="sampleLoop_UL">
	<li>#MAKERPARTCD#</li>
	<li class="emptyBody">UL</li>
</ul>


<p>
<!-- 일반 정보 뷰 폼 :selectOne -->
<!-- 일반 정보 뷰 폼  -->
<div class="group">_loopData INFO</div>
<p>
<button id="search_INFO">조회</button>

<table>
	<tbody id="sampleLoop_INFO"> 
	<!-- ajax 결과 json과 매핑하여 반복 출력할 html 의 부모노드에 아이디 지정(아이디가 없어도 선택할 수 만 있으면 됨) -->		
		<tr>
			<td>컬럼A</td><td><input type="text" value="#FAXNO3#"></td>
			<td>컬럼B</td><td><input type="text" value="#SMSNMSRV#"></td>
		</tr>
		<tr>
			<td>컬럼C</td><td><input type="text" value="#BIGO#"></td>
			<td>컬럼D</td><td><input type="text" value="#MAKERPARTCD#"></td>
		</tr>
		<tr>	
			<td>컬럼E</td><td><input type="text" value="#PRESIDENTNM#"></td>
			<td>컬럼F</td><td><input type="text" value="#MAKERPARTCD#"></td>
		</tr>
		<tr>	
			<td>컬럼G</td><td><input type="text" value="#ADDRESS1#"></td>
			<td>컬럼H</td><td><input type="text" value="#FAXNO3#"></td>
		</tr>
		<tr>	
			<td>컬럼I</td><td><input type="text" value="#FAXNO3#"></td>
			<td>컬럼J</td><td>#BRANDCD#</td><!-- selectbox 추가시  -->
		</tr>
	</tbody>
</table>






<p>
<!-- 엑셀  -->
<!-- 엑셀  -->
<div class="group">Excel down</div>
<p>
<button id="search_EXCEL">조회</button>
<button id="del_EXCEL">삭제</button>
<button id="down_EXCEL_POI">EXCEL다운로드_POI</button>
<button id="down_EXCEL_HTML">EXCEL다운로드_HTML</button>

<form id="form_EXCEL" action="./sampleExceldown.do"></form>

<p>
<table id = "excel_HTML">
<!-- html을 그대로 다운로드 할경우 table 노드에 아이디 지정 -->
	<thead>
		<tr>
			<th>컬럼A</th>
			<th>컬럼B</th>
			<th>컬럼C</th>
			<th>컬럼D</th>
			<th>컬럼E</th>
			<th>컬럼F</th>
			<th>컬럼G</th>
			<th>컬럼H</th>
		</tr>
	</thead>
	<tbody id="sampleLoop_EXCEL"> 
		<tr style="display: none;">
			<td>#FAXNO2#</td>
			<td>#FAXNO3#</td>
			<td>#SMSNMSRV#</td>
			<td>#BIGO#</td>
			<td>#BRANDCD#</td>
			<td>#PRESIDENTNM#</td>
			<td>#MAKERPARTCD#</td>
			<td>#ADDRESS1#</td>
		</tr>		
	</tbody>
</table>






<p>
<!-- 페이징  -->
<!-- 페이징  -->
<div class="group">Paging</div>
<p>
<button id="search_Paging">조회</button>
<button id="del_Paging">삭제</button>

<p>
<table>
<!-- html을 그대로 다운로드 할경우 table 노드에 아이디 지정 -->
	<thead>
		<tr>
			<th>컬럼A</th>
			<th>컬럼B</th>
			<th>컬럼C</th>
			<th>컬럼D</th>
			<th>컬럼E</th>
			<th>컬럼F</th>
			<th>컬럼G</th>
			<th>컬럼H</th>
		</tr>
	</thead>
	<tbody id="sampleLoop_Paging"> 
		<tr style="display: none;">
			<td>#SVCCHRGNM#</td>
			<td>#SVCREGNO#</td>
			<td>#TELNO1#</td>
			<td>#TELNO2#</td>
			<td>#ACCCLIENTCD#</td>
			<td>#ACCCLIENTNM#</td>
			<td>#ACCOUNTNO#</td>
			<td>#CLIENTNM#</td>
		</tr>	
		<tr class="emptyBody"><td>조회된 데이터가 없습니다.</td></tr>	
	</tbody>
</table>
<p>
<div id = "paging"></div>


<p>
<!-- fileUpload -->
<!-- fileUpload  -->
<div class="group">file Upload</div>
<p>
<input type="file"  id="fileInput">
<button id = "fileUpload">파일 업로드</button>
<br>
<p>
<!-- <input  multiple="multiple"  type="file"  id="fileInputMutli">
<button id = "fileUploadMutli">멀티 업로드</button> -->

<div id = "uploadedImg"></div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</body>
<jsp:include page="./include/common.jsp"/>
<script>


$(document).ready(function(){
	//WBS
	
	var setWbsRowInsertEvent = function(){// 단일 인서트
		$(".wbs_single_insert").off("click").click(function(){
			var p = $(this).closest("tr")._serializeJsonObject();// 단일 인서트(업데이트 딜리트 동일)
			//_serializeJsonObject =  선택자 하위에 있는 name 값을 json 형태로 반환
			//$("#form")._serializeJsonObject();  
			//$(".RoInfotable")._serializeJsonObject(); 
			
			
			if(_ajax("./insertWbs_single.do",p).rc){
				alert("저장에 성공하였습니다.");
			}else{
				alert("저장에 실패하였습니다.");
			}
			$("#wbs_tbody")._loopData(_ajax("./getWbs.do").rd);
		});
	};
	
	
	$("#wbs_tbody")._loopData(_ajax("./getWbs.do").rd);	
	setWbsRowInsertEvent();
	
	$("#add_wbs_form").click(function(){
		$("#wbs_tbody")._appendEmptyForm(); // 비어있는 폼 추가
		setWbsRowInsertEvent();
	});
	
	$("#wbs_multi_insert").click(function(){// 다중 인서트
		var p = {
			wbsForm : $("#wbs_tbody")._serializeJsonArray()// 다중 인서트
		}
		if(_ajax("./insertWbs_multi.do",p).rc){
			alert("저장에 성공하였습니다.");
		}else{
			alert("저장에 실패하였습니다.");
		}
		$("#wbs_tbody")._loopData(_ajax("./getWbs.do").rd);
	});
	

	
	
	//table
	$("#search_TABLE").click(function(){
		/* 조회와 동시 루프 
		_loopData 호출시 자동으로 비우고 새로작성하니 따로 empty() 또는 remove() 할 필요 없음.
		*/
		var brandCode = _getCode.getData({bsType:"SA",bsGrpCd:"010"});// 브랜드코드 셀렉트박스 데이터 
		$("#sampleLoop_TABLE")._loopData(_ajax("./getSampleList.do").rd,{
			FAXNO2 : function(v){
				return _pad(v,10);
			},
			BIGO : function(v){
				return v + " + 변환된 데이터";
			},
			// _loopData 에서의  SELECTBOX 로드 
			BRANDCD :function(v){
				var option = {
						data 		: brandCode		
						,value	: v 
				}
				return _getCode.getSelectBox(option);
			},
			// _loopData 에서의  checkBOX 로드 
			USEYN : function(v){
				return "<input type='checkbox' name ='USEYN' " + ( v  == "Y" ? "checked" : "" )+">";
			}
		});	
		/* 
		만약 데이터가 변환되야한다면 위와같이 function을 추가하고 _loopData호출의 인자로 넣어준다.
		function의 이름은 해당 key가 되어야 한다.
		데이터 변환 없이 그대로 출력한다면 ) $("#sampleLoop_TABLE")._loopData(_ajax("./getSampleList.do").rd);
		반복문안에 노드에 click , change 와같은 이벤트를 걸게되면 재조회시 이벤트가 삭제되기 때문에
		조회버튼 클릭이후 작성되어야 한다.
		*
		table 과 ul 로 예로 작성하였지만 어떤 태그든 사용가능하다. 
		*/
		
	});
	$("#del_TABLE").click(function(){
		$("#sampleLoop_TABLE").empty();	
	});
	
	
	
	
	
	//ul
	$("#search_Ul").click(function(){
		$("#sampleLoop_UL")._loopData(_ajax("./getSampleList.do").rd);	
	});
	$("#del_Ul").click(function(){
		$("#sampleLoop_UL").empty();	
	});
	
	
	
	
	
	
	//INFO
	$("#sampleLoop_INFO")._empty(); // _empty() 를 사용하면 매핑정보가 숨겨짐(입력폼으로 쓸경우 어짜피 비어있으니 거의 쓸필요없음.)
	
	
	
	//selectBox (일반)
	var selectBoxData  = _getCode.getData({bsType:"SA",bsGrpCd:"010"}); // 공통코드의 data 리턴
	var option = {
			data 		: selectBoxData  // 위에서 조회한 데이터 (필수)				
			,class 	: ""                   // selectBox 의 class (필수아님)
			,id			: ""					// selectBox 의 id (필수아님)	
			,name	: ""					// selectBox 의 name (필수아님)
			,value	: ""					// selectBox 에 선택될 값  (필수아님)
			,addEmpty	: false			// 	selectBox = true, false  / 최상위 "공백or택스트"을 추가하는가 (필수아님 /기본 false) 
			,addEmptyTxt	: "선택"		// 	selectBox 최상위 "들어가게될 택스트" 을 추가하는가 (필수아님 /기본 "")
			,returnType	: "html" 			// returnType =  html , obj  (필수아님 /기본 html)
	}
	var selectBox = _getCode.getSelectBox(option); // selectBox html 
	//  $("#sampleLoop_INFO").append(selectBox)   < 이런식으로 쓰면 됨
	
	
	$("#search_INFO").click(function(){
		var brandCode = _getCode.getData({bsType:"SA",bsGrpCd:"010"});// 브랜드코드 셀렉트박스 데이터
		$("#sampleLoop_INFO")._loopData(_ajax("./getSampleList.do").rd[0],{
			// _loopData 에서의  SELECTBOX 로드 
			BRANDCD :function(v){
				var option = {
						data 		: brandCode				
						,value	: v 
				}
				return _getCode.getSelectBox(option);
			}
		});	
	});

	
	
	
	
	
	//EXCEL
	$("#search_EXCEL").click(function(){
		$("#sampleLoop_EXCEL")._loopData(_ajax("./getSampleList.do").rd);	
	});
	$("#down_EXCEL_POI").click(function(){
		$("#form_EXCEL").submit();
		//자바소스 참조
	});
	$("#down_EXCEL_HTML").click(function(){
		$("#excel_HTML")._excelDown("엑셀_" + _getTodayDate());
		//파일명을 넘길경우 파일명으로 아닐경우 화면명 
	});
	$("#del_EXCEL").click(function(){
		$("#sampleLoop_EXCEL").empty();	
	});
	
	
	
	
	
	//paging
	$("#search_Paging").click(function(){
		var param = {
			pagingDiv 		: "paging"
			,SHOPCD 		: "ASDFASDF"
			,USERCD 		: "SAAS"
			,dataSize		:	5
		}
		
		//보내려는 파람에 pagingDiv 를 추가하고 패이징을 표시할 컨테이너 ID를 입력한다.
		// 한페이지에 보여줄 로우를 지정하려면 dataSize 를 추가한다 default 는 10이다.
		
		//서버단 자바소스 참조
		$("#sampleLoop_Paging")._loopData(_ajax("./getSampleList_paging.do",param).rd);	
	});
	$("#del_Paging").click(function(){
		$("#sampleLoop_Paging").empty();
		$("#paging").empty();	
	});
	
	//fileUpload
	$("#fileUpload").click(function(){ 
		var file = $("#fileInput")._fileUpload({
			uploadPath 	: "reqUpladPathTest2/" + _getTodayDate()  // 경로의 맨앞뒤는 "/" 또는 "\" 사용 X (필수아님)    
			,fileName		: "test1"+"SHOPCD"									// 파일명	(필수아님)  																
			//,fileEx			: "jpg,jpeg"												// 확장자 조건 (필수아님) 
			,fileSize			: 0.5														// 파일사이즈 조건(Mb) (필수아님) // 미입력시 5M 
		});
		console.log(file);
		$(file.rd).each(function(){
			var html = "<img src = '"+this.hrefPath +"'></img>";
			$("#uploadedImg").append(html);
		});
	});

});



</script>
</html>
