Class BO.ReservationCategorie Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method findVoitureByCategory(pRequest As msg.reserverCategorieDmde, Output pResponse As msg.reserverCategorieRpse) As %Status
{
    set pResponse = ##class(msg.reserverCategorieRpse).%New()

    set sql = "select plaque from data.Voiture where categorie = '"_pRequest.category_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.category_"'"
    set sql = sql_" and ((dateDebut >= '"_pRequest.startDate_"' and dateDebut <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.startDate_"' and dateFin <= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.startDate_"' and dateFin >= '"_pRequest.endDate_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.startDate_"' and dateFin <= '"_pRequest.endDate_"' ))) "

    set statement=##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set SQLrequest = statement.%Execute()
    do SQLrequest.%Next()
    set plaqueReceive = SQLrequest.%Get("plaque")
   
    if $LENGTH(plaqueReceive) > 0 {
        set pResponse.codeRetour = "OK"
        set pResponse.plaque = plaqueReceive

        Quit $$$OK
    }
    set pResponse.codeRetour = "KO"
    set pResponse.libErreur = "Il n'y a pas de voiture disponible pour cette catégorie."
    Quit $$$OK
}

Method book(pRequest As msg.reserverVoitureDmde, Output pResponse As msg.reserverVoitureRpse) As %Status
{
    set pResponse = ##class(msg.reserverVoitureRpse).%New() 

    set reservation = ##class(data.Reservation).%New()
    do ##class(data.Voiture).consulterParPlaqueExists(pRequest.plaque, .id)
    set reservation.voiture = ##class(data.Voiture).%OpenId(id)
    set reservation.dateDebut = pRequest.startDate
    set reservation.dateFin = pRequest.endDate

    set reservationSave = reservation.%Save()

    if 'reservationSave {
            set pResponse.codeRetour = "KO"
            set pResponse.libErreur = "Un problème a eu lieu lors de la réservation"
            Quit $$$OK
    }

    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.reserverCategorieDmde">
        <Method>findVoitureByCategory</Method>
    </MapItem>
    <MapItem MessageType="msg.reserverVoitureDmde">
        <Method>book</Method>
    </MapItem>
</MapItems>
}

}
