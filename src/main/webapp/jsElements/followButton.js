let flwBtns = document.getElementsByName("flwbtn");



		flwBtns.forEach(function(flwBtn){
		    let userid = flwBtn.value;
		    flwBtn.onclick=function(){
		        let followreq = new XMLHttpRequest();
		        followreq.onreadystatechange= function(){
		        	console.log(this.responseText);
		            flwBtn.innerText= this.responseText;
		        };
		        followreq.open("POST","/G_Draft_1/ExplorePageServlet?followid="+userid);
		        followreq.send();
		    };
		});