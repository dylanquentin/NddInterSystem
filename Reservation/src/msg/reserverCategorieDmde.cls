Class msg.reserverCategorieDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property category As %String;

Property startDate As %TimeStamp;

Property endDate As %TimeStamp;

Storage Default
{
<Data name="reserverCategorieDmdeDefaultData">
<Subscript>"reserverCategorieDmde"</Subscript>
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
<DefaultData>reserverCategorieDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
