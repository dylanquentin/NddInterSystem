Class msg.retirerParcDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="retirerParcDmdeDefaultData">
<Subscript>"retirerParcDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>retirerParcDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
