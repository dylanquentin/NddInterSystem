Class msg.reserverVoitureDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String(MAXLEN = 9, MINLEN = 9);

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="reserverVoitureDmdeDefaultData">
<Subscript>"reserverVoitureDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
<Value name="2">
<Value>startDate</Value>
</Value>
<Value name="3">
<Value>endDate</Value>
</Value>
</Data>
<DefaultData>reserverVoitureDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
