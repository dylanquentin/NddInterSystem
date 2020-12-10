Class msg.checkReservationRpse Extends msg.basic.reponse
{

Property reservation As %Integer;

Storage Default
{
<Data name="checkReservationRpseDefaultData">
<Subscript>"checkReservationRpse"</Subscript>
<Value name="1">
<Value>reservation</Value>
</Value>
</Data>
<DefaultData>checkReservationRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
