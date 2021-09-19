<cfset key="PutKeyHere" />

<cfsavecontent variable="theJson">
{
  "input":{
    "text":"Hi All CFMl fans"
  },
  "voice":{
    "languageCode":"en-US"
  },
  "audioConfig":{
    "audioEncoding":"MP3"
  }
}
</cfsavecontent>


<cfhttp url="https://texttospeech.googleapis.com/v1/text:synthesize?key=#key#" result="resultaat" method="post"  throwonerror="no" charset="utf-8">
    <cfhttpparam type="header" name="Content-Type" value="application/json; charset=utf-8">
    <cfhttpparam type="body" value="#theJson#">
</cfhttp> 

<cfset result = deSerializeJson(resultaat.filecontent) />

<cfset fileData = toBinary( result.audiocontent ) />
<cffile action="write" file="#expandPath('r.mp3')#" output="#fileData#">

