;CheckWriter GUI
;Written by Derek Ritchie
;www.derekritchie.com
;Description: GUI for check printing HTML template by Michael Scepaniak https://github.com/hispanic/check-print

;Check 1
Gui,Add,Edit,x450 y25 w100 h20 vCheck1Date,Check1Date
Gui,Font,Normal s10 c0x0 Bold,Tahoma
Gui,Add,Text,x10 y10 w100 h16,Check 1
Gui,Font
Gui,Add,Text,x420 y30 w26 h16,Date
Gui,Add,Edit,x75 y50 w300 h20 vCheck1PayTo,Check1PayTo
Gui,Add,Edit,x450 y50 w100 h20 vCheck1AmountNbr,Check1AmountNbr
Gui,Add,Edit,x75 y75 w300 h20 vCheck1AmountTxt,Check1AmountTxt
Gui,Add,Text,x18 y75 w50 h16,AmountTxt
Gui,Add,Text,x18 y50 w50 h16,Pay to
Gui,Add,Text,x400 y50 w50 h16,Amount
Gui,Add,Text,x18 y100 w50 h16,Address
Gui,Add,Text,x18 y225 w50 h16,Memo
Gui,Add,Edit,x75 y100 w300 h20 vCheck1Address1,Check1Address1
Gui,Add,Edit,x75 y125 w300 h20 vCheck1Address2,Check1Address2
Gui,Add,Edit,x75 y150 w300 h20 vCheck1Address3,Check1Address3
Gui,Add,Edit,x75 y175 w300 h20 vCheck1Address4,Check1Address4
Gui,Add,Edit,x75 y200 w300 h20 vCheck1Address5,Check1Address5
Gui,Add,Edit,x60 y225 w300 h20 vCheck1Memo,Check1Memo

;Check 2
Gui,Add,Edit,x450 y275 w100 h20 vCheck2Date,
Gui,Font,Normal s10 c0x0 Bold,Tahoma
Gui,Add,Text,x10 y250 w100 h16,Check 2
Gui,Font
Gui,Add,Text,x420 y275 w26 h16,Date
Gui,Add,Edit,x75 y300 w300 h20 vCheck2PayTo,
Gui,Add,Edit,x450 y300 w100 h20 vCheck2AmountNbr,
Gui,Add,Edit,x75 y325 w300 h20 vCheck2AmountTxt,
Gui,Add,Text,x18 y325 w50 h16,AmountTxt
Gui,Add,Text,x18 y300 w50 h16,Pay to
Gui,Add,Text,x400 y300 w50 h16,Amount
Gui,Add,Text,x18 y350 w50 h16,Address
Gui,Add,Text,x18 y475 w50 h16,Memo
Gui,Add,Edit,x75 y350 w300 h20 vCheck2Address1,
Gui,Add,Edit,x75 y375 w300 h20 vCheck2Address2,
Gui,Add,Edit,x75 y400 w300 h20 vCheck2Address3,
Gui,Add,Edit,x75 y425 w300 h20 vCheck2Address4,
Gui,Add,Edit,x75 y450 w300 h20 vCheck2Address5,
Gui,Add,Edit,x60 y475 w300 h20 vCheck2Memo,

;Check 3
Gui,Add,Edit,x450 y525 w100 h20 vCheck3Date,
Gui,Font,Normal s10 c0x0 Bold,Tahoma
Gui,Add,Text,x10 y500 w100 h16,Check 3
Gui,Font
Gui,Add,Text,x420 y525 w26 h16,Date
Gui,Add,Edit,x75 y550 w300 h20 vCheck3PayTo,
Gui,Add,Edit,x450 y550 w100 h20 vCheck3AmountNbr,
Gui,Add,Edit,x75 y575 w300 h20 vCheck3AmountTxt,
Gui,Add,Text,x18 y575 w50 h16,AmountTxt
Gui,Add,Text,x18 y550 w50 h16,Pay to
Gui,Add,Text,x400 y550 w50 h16,Amount
Gui,Add,Text,x18 y600 w50 h16,Address
Gui,Add,Text,x18 y725 w50 h16,Memo
Gui,Add,Edit,x75 y600 w300 h20 vCheck3Address1,
Gui,Add,Edit,x75 y625 w300 h20 vCheck3Address2,
Gui,Add,Edit,x75 y650 w300 h20 vCheck3Address3,
Gui,Add,Edit,x75 y675 w300 h20 vCheck3Address4,
Gui,Add,Edit,x75 y700 w300 h20 vCheck3Address5,
Gui,Add,Edit,x60 y725 w300 h20 vCheck3Memo,

Gui,Add,Button,x600 y30 gOnSubmit, Create File

Gui,Show,x255 y13 w700 h750 ,
Return
GuiClose:
ExitApp
Return


OnSubmit:
Gui, Submit

	CheckFile = 
		(
<!-- This Source Code Form is subject to the terms of the Mozilla Public
   - License, v. 2.0. If a copy of the MPL was not distributed with this
   - file, You can obtain one at http://mozilla.org/MPL/2.0/. -->

<!-- 
	Need instructions or want more info? I live at https://github.com/hispanic/check-print 
	Copyright © 2013 Michael Harry Scepaniak
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>

<!-- Remove the protocol prefix (i.e., "http:") if hosting on a server instead of from localhost. -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>
	// Check #1.
	var checkData1 = { 	
		"date"          : "%Check1Date%", // The date when the check is first eligible to be cashed/deposited. e.g. 05/01/2013
		"payTo"         : "%Check1PayTo%", // To whom the check should be made out. e.g. Michael Harry Scepaniak
		"amountNbr"     : "%Check1AmountNbr%", // The amount of the check, as a number. e.g. 13,100.00
		"amountTxt"     : "%Check1AmountTxt%", // The amount of the check, written out long-form. e.g. Thirteen thousand one hundred and 00/100
		"payToAddress"  : [ // Lines 1 through 5 of the recipient's address.
			"%Check1Address1%", // e.g. 1313 Mockingird Lane
			"%Check1Address2%", // e.g. Cockeysville, MD 22178
			"%Check1Address3%", 
			"%Check1Address4%", 
			"%Check1Address5%"],
		"%Check1Memo%"          : "REPLACE-ME" // A short note to include on the check. e.g. Just a small thank you.
		};

	// Check #2. If you only need to print one check, leave the values for this check blank.
	var checkData2 = { 	
		"date"          : "%Check2Date%",
		"payTo"         : "%Check2PayTo%",
		"amountNbr"     : "%Check2AmountNbr%",
		"amountTxt"     : "%Check2AmountTxt%",
		"payToAddress"  : [
			"%Check2Address1%", 
			"%Check2Address2%", 
			"%Check2Address3%", 
			"%Check2Address4%", 
			"%Check2Address5%"],
		"memo"          : "%Check2Memo%"
		};

	// Check #3. If you only need to print two checks, leave the values for this third check blank.
	var checkData3 = { 	
		"date"          : "%Check3Date%",
		"payTo"         : "%Check3PayTo%",
		"amountNbr"     : "%Check3AmountNbr%",
		"amountTxt"     : "%Check3AmountTxt%",
		"payToAddress"  : [
			"%Check3Address1%", 
			"%Check3Address2%", 
			"%Check3Address3%", 
			"%Check3Address4%", 
			"%Check3Address5%"],
		"memo"          : "%Check3Memo%"
		};
		
	/*
	 * ============================================
	 * NO NEED TO MODIFY ANYTHING BELOW THIS POINT.
	 * ============================================
	 */

	jQuery(document).ready(function() {
		populateCheck(1, checkData1);
		populateCheck(2, checkData2);
		populateCheck(3, checkData3);
	})
	
	var populateCheck = function(checkNbr, checkData)
	{
		jQuery("div#check-" + checkNbr + "-date-box").html(checkData.date);
		jQuery("div#check-" + checkNbr + "-pay-to-box").html(checkData.payTo);
		jQuery("div#check-" + checkNbr + "-amount-nbr-box").html(checkData.amountNbr);
		jQuery("div#check-" + checkNbr + "-amount-txt-box").html(checkData.amountTxt);
		jQuery("div#check-" + checkNbr + "-pay-to-address-box pre").html(buildAddressBlock(checkData.payToAddress));
		jQuery("div#check-" + checkNbr + "-memo-box").html(checkData.memo);
	}
	
	var buildAddressBlock = function(addressLines)
	{
		var addressBlock = "";
		for (var i = 0; i < addressLines.length; i++)
		{
			var addressLine = addressLines[i];
			if (addressLine !== undefined && addressLine !== null && addressLine.length > 0)
			{
				if (addressBlock.length > 0)
				{
					addressBlock += "<br />";
				}
				addressBlock += "         " + addressLine;
			}
		}
		return addressBlock;
	}
</script>

<style>
	div
	{
		position: absolute;
	}
	
	div#check-1-date-box
	{
		left: 600px;
		top: 0px;
	}
	
	div#check-1-pay-to-box
	{
		left: 30px;
		top: 50px;
	}
	
	div#check-1-amount-nbr-box
	{
		left: 600px;
		top: 45px;
	}
	
	div#check-1-amount-txt-box
	{
		left: 0px;
		top: 83px;
	}
	
	div#check-1-pay-to-address-box
	{
		left: 30px;
		top: 98px;
	}
	
	div#check-1-memo-box
	{
		left: 20px;
		top: 185px;
	}

	div#check-2-date-box
	{
		left: 600px;
		top: 335px;
	}
	
	div#check-2-pay-to-box
	{
		left: 30px;
		top: 385px;
	}
	
	div#check-2-amount-nbr-box
	{
		left: 600px;
		top: 380px;
	}
	
	div#check-2-amount-txt-box
	{
		left: 0px;
		top: 418px;
	}
	
	div#check-2-pay-to-address-box
	{
		left: 30px;
		top: 433px;
	}
	
	div#check-2-memo-box
	{
		left: 20px;
		top: 522px;
	}

	div#check-3-date-box
	{
		left: 600px;
		top: 670px;
	}
	
	div#check-3-pay-to-box
	{
		left: 30px;
		top: 720px;
	}
	
	div#check-3-amount-nbr-box
	{
		left: 600px;
		top: 715px;
	}
	
	div#check-3-amount-txt-box
	{
		left: 0px;
		top: 753px;
	}
	
	div#check-3-pay-to-address-box
	{
		left: 30px;
		top: 768px;
	}
	
	div#check-3-memo-box
	{
		left: 20px;
		top: 859px;
	}
</style>
</head>
<body>
	<div id="check-1-date-box">
	
	</div>
	<div id="check-1-pay-to-box">
	
	</div>
	<div id="check-1-amount-nbr-box">
	
	</div>
	<div id="check-1-amount-txt-box">
	
	</div>
	<div id="check-1-pay-to-address-box">
	<pre>

	</pre>
	</div>
	<div id="check-1-memo-box">
	
	</div>

	<div id="check-2-date-box">
	
	</div>
	<div id="check-2-pay-to-box">
	
	</div>
	<div id="check-2-amount-nbr-box">
	
	</div>
	<div id="check-2-amount-txt-box">
	
	</div>
	<div id="check-2-pay-to-address-box">
	<pre>
	
	</pre>
	</div>
	<div id="check-2-memo-box">
	
	</div>

	<div id="check-3-date-box">
	
	</div>
	<div id="check-3-pay-to-box">
	
	</div>
	<div id="check-3-amount-nbr-box">
	
	</div>
	<div id="check-3-amount-txt-box">
	
	</div>
	<div id="check-3-pay-to-address-box">
	<pre>
	
	</pre>
	</div>
	<div id="check-3-memo-box">
	
	</div>
</body>
</html>
		)
		
FileAppend, %CheckFile%, %A_ScriptDir%\Check_%A_Now%.html
ExitApp
Return
