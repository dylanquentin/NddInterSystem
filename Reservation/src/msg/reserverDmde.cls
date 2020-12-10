Class msg.reserverDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property category As %String;

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="reserverDmdeDefaultData">
<Subscript>"reserverDmde"</Subscript>
<Value name="1">
<Value>category</Value>
</Value>
<Value name="2">
<Value>startDate</Value>
</Value>
<Value name="3">
<Value>endDate</Value>
</Value>
</Data>
<DefaultData>reserverDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
