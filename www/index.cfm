<cfset key="Put-Key0Here" />

<cfsavecontent variable="payLoad">
{
  "input":{
    "text":"Hi All CFML fans"
  },
  "voice":{
    "languageCode":"en-US"
  },
  "audioConfig":{
    "audioEncoding":"MP3"
  }
}
</cfsavecontent>


<cfhttp encodeurl="false" url="https://texttospeech.googleapis.com/v1/text:synthesize?key=#key#" result="resultaat" method="post"  throwonerror="no" charset="utf-8">
    <cfhttpparam type="header" name="Content-Type" value="application/json; charset=utf-8" />
    <cfhttpparam type="body" value="#payLoad#" />
</cfhttp> 

<cfdump var="#resultaat#" />

<cfset result = deSerializeJson(resultaat.filecontent) />

<cfset fileData = toBinary( result.audiocontent ) />

<cffile action="write" file="#expandPath('file.mp3')#" output="#fileData#">