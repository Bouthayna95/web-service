/*==============================================================*/
/* Table: APPLI_ABONNEMENT_TC                                   */
/*==============================================================*/
create table APPLI_ABONNEMENT_TC (
CODE_VELO            INT4                 not null,
CODE_NATIONALE       INT4                 not null,
CODE_DEPARTEMENTAL   INT4                 not null,
ID_PERSONNE          INT4                 not null,
CODE_URBAIN          INT4                 not null,
constraint PK_APPLI_ABONNEMENT_TC primary key (CODE_VELO, CODE_NATIONALE, CODE_DEPARTEMENTAL, ID_PERSONNE, CODE_URBAIN)
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC_PK                                */
/*==============================================================*/
create unique index APPLI_ABONNEMENT_TC_PK on APPLI_ABONNEMENT_TC (
CODE_VELO,
CODE_NATIONALE,
CODE_DEPARTEMENTAL,
ID_PERSONNE,
CODE_URBAIN
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC_FK                                */
/*==============================================================*/
create  index APPLI_ABONNEMENT_TC_FK on APPLI_ABONNEMENT_TC (
CODE_VELO
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC2_FK                               */
/*==============================================================*/
create  index APPLI_ABONNEMENT_TC2_FK on APPLI_ABONNEMENT_TC (
CODE_NATIONALE
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC3_FK                               */
/*==============================================================*/
create  index APPLI_ABONNEMENT_TC3_FK on APPLI_ABONNEMENT_TC (
CODE_DEPARTEMENTAL
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC4_FK                               */
/*==============================================================*/
create  index APPLI_ABONNEMENT_TC4_FK on APPLI_ABONNEMENT_TC (
ID_PERSONNE
);

/*==============================================================*/
/* Index: APPLI_ABONNEMENT_TC5_FK                               */
/*==============================================================*/
create  index APPLI_ABONNEMENT_TC5_FK on APPLI_ABONNEMENT_TC (
CODE_URBAIN
);

/*==============================================================*/
/* Table: APPLI_ACTIVITE                                        */
/*==============================================================*/
create table APPLI_ACTIVITE (
LATITUDE             FLOAT8               null,
LONGITUDE            FLOAT8               null,
HEURE_DEBUT          DATE                 null,
HEURE_FIN            DATE                 null,
NOM_LIEU             TEXT                 null,
ID_ACTIVITE          SERIAL               not null,
constraint PK_APPLI_ACTIVITE primary key (ID_ACTIVITE)
);

/*==============================================================*/
/* Index: APPLI_ACTIVITE_PK                                     */
/*==============================================================*/
create unique index APPLI_ACTIVITE_PK on APPLI_ACTIVITE (
ID_ACTIVITE
);

/*==============================================================*/
/* Table: APPLI_ADRESSE                                         */
/*==============================================================*/
create table APPLI_ADRESSE (
ID_ADRESSE           INT4                 not null,
ID_PERSONNE          INT4                 not null,
CODE_TYPE_LIEU       INT4                 not null,
LIBELLE_NATIONAL     TEXT                 null,
GEOM                 TEXT                 null,
constraint PK_APPLI_ADRESSE primary key (ID_ADRESSE)
);

/*==============================================================*/
/* Index: APPLI_ADRESSE_PK                                      */
/*==============================================================*/
create unique index APPLI_ADRESSE_PK on APPLI_ADRESSE (
ID_ADRESSE
);

/*==============================================================*/
/* Index: APPLI_TYPE_ADRESSE_FK                                 */
/*==============================================================*/
create  index APPLI_TYPE_ADRESSE_FK on APPLI_ADRESSE (
CODE_TYPE_LIEU
);

/*==============================================================*/
/* Index: APPLI_LISTE_ADRESSE_FK                                */
/*==============================================================*/
create  index APPLI_LISTE_ADRESSE_FK on APPLI_ADRESSE (
ID_PERSONNE
);

/*==============================================================*/
/* Table: APPLI_ANIME                                           */
/*==============================================================*/
create table APPLI_ANIME (
ID_POINT_ARRET       INT4                 not null,
ID_ACTIVITE          INT4                 not null,
constraint PK_APPLI_ANIME primary key (ID_POINT_ARRET, ID_ACTIVITE)
);

/*==============================================================*/
/* Index: APPLI_ANIME_PK                                        */
/*==============================================================*/
create unique index APPLI_ANIME_PK on APPLI_ANIME (
ID_POINT_ARRET,
ID_ACTIVITE
);

/*==============================================================*/
/* Index: APPLI_ANIME_FK                                        */
/*==============================================================*/
create  index APPLI_ANIME_FK on APPLI_ANIME (
ID_POINT_ARRET
);

/*==============================================================*/
/* Index: APPLI_ANIME2_FK                                       */
/*==============================================================*/
create  index APPLI_ANIME2_FK on APPLI_ANIME (
ID_ACTIVITE
);

/*==============================================================*/
/* Table: APPLI_CODIFICATION_PCS                                */
/*==============================================================*/
create table APPLI_CODIFICATION_PCS (
CODE_PCS             INT4                 not null,
LIBELLE_PCS          TEXT                 null,
constraint PK_APPLI_CODIFICATION_PCS primary key (CODE_PCS)
);

/*==============================================================*/
/* Index: APPLI_CODIFICATION_PCS_PK                             */
/*==============================================================*/
create unique index APPLI_CODIFICATION_PCS_PK on APPLI_CODIFICATION_PCS (
CODE_PCS
);

/*==============================================================*/
/* Table: APPLI_DEPLACEMENT                                     */
/*==============================================================*/
create table APPLI_DEPLACEMENT (
ID_DEPLACEMENT       INT4                 not null,
CODE_ZONE            TEXT                 not null,
ZON_CODE_ZONE        TEXT                 not null,
ID_PERSONNE          INT4                 not null,
COEFFICIENT_REDRESSEMENT FLOAT8               null,
constraint PK_APPLI_DEPLACEMENT primary key (ID_DEPLACEMENT)
);

/*==============================================================*/
/* Index: APPLI_DEPLACEMENT_PK                                  */
/*==============================================================*/
create unique index APPLI_DEPLACEMENT_PK on APPLI_DEPLACEMENT (
ID_DEPLACEMENT
);

/*==============================================================*/
/* Index: APPLI_FICHE_DEPLACEMENT_FK                            */
/*==============================================================*/
create  index APPLI_FICHE_DEPLACEMENT_FK on APPLI_DEPLACEMENT (
ID_PERSONNE
);

/*==============================================================*/
/* Index: ZONE_ORG_DEPLACEMENT_FK                               */
/*==============================================================*/
create  index ZONE_ORG_DEPLACEMENT_FK on APPLI_DEPLACEMENT (
ZON_CODE_ZONE
);

/*==============================================================*/
/* Index: ZONE_DEST_DEPLACEMENT_FK                              */
/*==============================================================*/
create  index ZONE_DEST_DEPLACEMENT_FK on APPLI_DEPLACEMENT (
CODE_ZONE
);

/*==============================================================*/
/* Table: APPLI_ETABLISSEMENT_SCOLAIRE                          */
/*==============================================================*/
create table APPLI_ETABLISSEMENT_SCOLAIRE (
CODE_ETABLISSAMENT   INT4                 not null,
LIBELLE_ETABLISSEMENT TEXT                 null,
constraint PK_APPLI_ETABLISSEMENT_SCOLAIR primary key (CODE_ETABLISSAMENT)
);

/*==============================================================*/
/* Index: APPLI_ETABLISSEMENT_SCOLAIRE_PK                       */
/*==============================================================*/
create unique index APPLI_ETABLISSEMENT_SCOLAIRE_PK on APPLI_ETABLISSEMENT_SCOLAIRE (
CODE_ETABLISSAMENT
);

/*==============================================================*/
/* Table: APPLI_FREQUENCE_USAGE                                 */
/*==============================================================*/
create table APPLI_FREQUENCE_USAGE (
CODE_FREQUENCE_USAGE INT4                 not null,
LIBELLE_FREQUENCE_USAGE TEXT                 null,
constraint PK_APPLI_FREQUENCE_USAGE primary key (CODE_FREQUENCE_USAGE)
);

/*==============================================================*/
/* Index: APPLI_FREQUENCE_USAGE_PK                              */
/*==============================================================*/
create unique index APPLI_FREQUENCE_USAGE_PK on APPLI_FREQUENCE_USAGE (
CODE_FREQUENCE_USAGE
);

/*==============================================================*/
/* Table: APPLI_MENAGE                                          */
/*==============================================================*/
create table APPLI_MENAGE (
ID_MENAGE            INT4                 not null,
CODE_HABITAT         INT4                 null,
NB_PERSONNES         INT4                 null,
NB_MOINS_15_ANS      INT4                 null,
PRATIQUE_COVOITURAGE BOOL                 null,
NB_VEHICULES         INT4                 null,
NB_DEUX_ROUES_MOTORISES INT4                 null,
NB_VELOS             INT4                 null,
COEFFICIENT_REDRESSEMENT FLOAT8               null,
constraint PK_APPLI_MENAGE primary key (ID_MENAGE)
);

/*==============================================================*/
/* Index: APPLI_MENAGE_PK                                       */
/*==============================================================*/
create unique index APPLI_MENAGE_PK on APPLI_MENAGE (
ID_MENAGE
);

/*==============================================================*/
/* Index: HABITE_LOGEMENT_FK                                    */
/*==============================================================*/
create  index HABITE_LOGEMENT_FK on APPLI_MENAGE (
CODE_HABITAT
);

/*==============================================================*/
/* Table: APPLI_MODE_DEPLACEMENT                                */
/*==============================================================*/
create table APPLI_MODE_DEPLACEMENT (
CODE_APPLI_MODE      INT4                 not null,
LIBELLE_APPLI_MODE   TEXT                 null,
constraint PK_APPLI_MODE_DEPLACEMENT primary key (CODE_APPLI_MODE)
);

/*==============================================================*/
/* Index: APPLI_MODE_DEPLACEMENT_PK                             */
/*==============================================================*/
create unique index APPLI_MODE_DEPLACEMENT_PK on APPLI_MODE_DEPLACEMENT (
CODE_APPLI_MODE
);

/*==============================================================*/
/* Table: APPLI_MOTIF                                           */
/*==============================================================*/
create table APPLI_MOTIF (
CODE_QUALIFICATION   INT4                 not null,
ID_DEPLACEMENT       INT4                 not null,
CODE_CORRECTION      INT4                 not null,
CODE_APPLI_MOTIF     INT4                 not null,
constraint PK_APPLI_MOTIF primary key (CODE_QUALIFICATION, ID_DEPLACEMENT, CODE_CORRECTION, CODE_APPLI_MOTIF)
);

/*==============================================================*/
/* Index: APPLI_MOTIF_PK                                        */
/*==============================================================*/
create unique index APPLI_MOTIF_PK on APPLI_MOTIF (
CODE_QUALIFICATION,
ID_DEPLACEMENT,
CODE_CORRECTION,
CODE_APPLI_MOTIF
);

/*==============================================================*/
/* Index: APPLI_MOTIF_FK                                        */
/*==============================================================*/
create  index APPLI_MOTIF_FK on APPLI_MOTIF (
CODE_QUALIFICATION
);

/*==============================================================*/
/* Index: APPLI_MOTIF2_FK                                       */
/*==============================================================*/
create  index APPLI_MOTIF2_FK on APPLI_MOTIF (
ID_DEPLACEMENT
);

/*==============================================================*/
/* Index: APPLI_MOTIF3_FK                                       */
/*==============================================================*/
create  index APPLI_MOTIF3_FK on APPLI_MOTIF (
CODE_CORRECTION
);

/*==============================================================*/
/* Index: APPLI_MOTIF4_FK                                       */
/*==============================================================*/
create  index APPLI_MOTIF4_FK on APPLI_MOTIF (
CODE_APPLI_MOTIF
);

/*==============================================================*/
/* Table: APPLI_MOTIF_DEPLACEMENT                               */
/*==============================================================*/
create table APPLI_MOTIF_DEPLACEMENT (
CODE_APPLI_MOTIF     INT4                 not null,
LIBELLE_APPLI_MOTIF  TEXT                 null,
constraint PK_APPLI_MOTIF_DEPLACEMENT primary key (CODE_APPLI_MOTIF)
);

/*==============================================================*/
/* Index: APPLI_MOTIF_DEPLACEMENT_PK                            */
/*==============================================================*/
create unique index APPLI_MOTIF_DEPLACEMENT_PK on APPLI_MOTIF_DEPLACEMENT (
CODE_APPLI_MOTIF
);

/*==============================================================*/
/* Table: APPLI_PERSONNE                                        */
/*==============================================================*/
create table APPLI_PERSONNE (
ID_PERSONNE          INT4                 not null,
CODE_FREQUENCE_USAGE INT4                 not null,
NUM_VEHICULE         INT4                 null,
CODE_SEXE            INT4                 not null,
CODE_OCCUPATION      INT4                 not null,
ID_MENAGE            INT4                 not null,
CODE_PERMIS          INT4                 not null,
CODE_ETABLISSAMENT   INT4                 null,
DATE_DE_NAISSANCE    DATE                 null,
PRATIQUE_DEUX_ROUES  BOOL                 null,
PRATIQUE_VELO        BOOL                 null,
TRAVAIL_DOMICILE     BOOL                 null,
APPRENTISSAGE        BOOL                 null,
COEFFICIENT_REDRESSEMENT FLOAT8               null,
LOGIN                TEXT                 null,
MOT_DE_PASSE         TEXT                 null,
constraint PK_APPLI_PERSONNE primary key (ID_PERSONNE)
);

/*==============================================================*/
/* Index: APPLI_PERSONNE_PK                                     */
/*==============================================================*/
create unique index APPLI_PERSONNE_PK on APPLI_PERSONNE (
ID_PERSONNE
);

/*==============================================================*/
/* Index: APLLI_FREQUENCE_DEPLACEMENT_TRA                       */
/*==============================================================*/
create  index APLLI_FREQUENCE_DEPLACEMENT_TRA on APPLI_PERSONNE (
CODE_FREQUENCE_USAGE
);

/*==============================================================*/
/* Index: APPLI_EST_DE_SEXE_FK                                  */
/*==============================================================*/
create  index APPLI_EST_DE_SEXE_FK on APPLI_PERSONNE (
CODE_SEXE
);

/*==============================================================*/
/* Index: APPLI_FICHE_PERSONNE_FK                               */
/*==============================================================*/
create  index APPLI_FICHE_PERSONNE_FK on APPLI_PERSONNE (
ID_MENAGE
);

/*==============================================================*/
/* Index: APPLI_NIVEAU_SCOLAIRE_FK                              */
/*==============================================================*/
create  index APPLI_NIVEAU_SCOLAIRE_FK on APPLI_PERSONNE (
CODE_ETABLISSAMENT
);

/*==============================================================*/
/* Index: APPLI_TRAVAILLE_FK                                    */
/*==============================================================*/
create  index APPLI_TRAVAILLE_FK on APPLI_PERSONNE (
CODE_OCCUPATION
);

/*==============================================================*/
/* Index: APPLI_EST_TITULAIRE_FK                                */
/*==============================================================*/
create  index APPLI_EST_TITULAIRE_FK on APPLI_PERSONNE (
CODE_PERMIS
);

/*==============================================================*/
/* Index: VEHICULE_PREFERENTIEL_FK                              */
/*==============================================================*/
create  index VEHICULE_PREFERENTIEL_FK on APPLI_PERSONNE (
NUM_VEHICULE
);

/*==============================================================*/
/* Table: APPLI_POINT_ARRET                                     */
/*==============================================================*/
create table APPLI_POINT_ARRET (
ID_POINT_ARRET       INT4                 not null,
ID_DEPLACEMENT       INT4                 not null,
LATITUDE             FLOAT8               null,
LONGITUDE            FLOAT8               null,
HEURE_ARRIVEE        DATE                 null,
HEURE_DEPART         DATE                 null,
RAYON                INT4                 null,
constraint PK_APPLI_POINT_ARRET primary key (ID_POINT_ARRET)
);

/*==============================================================*/
/* Index: APPLI_POINT_ARRET_PK                                  */
/*==============================================================*/
create unique index APPLI_POINT_ARRET_PK on APPLI_POINT_ARRET (
ID_POINT_ARRET
);

/*==============================================================*/
/* Index: APPLI_COMPORTE_ARRET_FK                               */
/*==============================================================*/
create  index APPLI_COMPORTE_ARRET_FK on APPLI_POINT_ARRET (
ID_DEPLACEMENT
);

/*==============================================================*/
/* Table: APPLI_POINT_ITINERAIRE                                */
/*==============================================================*/
create table APPLI_POINT_ITINERAIRE (
ID_POINT_ITINERAIRE  INT4                 not null,
ID_ACTIVITE          INT4                 null,
ID_TRAJET            INT4                 not null,
HORODATE             DATE                 null,
LONGITUDE            FLOAT8               null,
LATITUDE             FLOAT8               null,
VITESSE              INT4                 null,
PRECISION            INT4                 null,
AZIMUT               INT4                 null,
ALTITUDE             INT4                 null,
ORIGINE_DPL          BOOL                 null,
DESTINATION_DPL      FLOAT8               null,
constraint PK_APPLI_POINT_ITINERAIRE primary key (ID_POINT_ITINERAIRE)
);

/*==============================================================*/
/* Index: APPLI_POINT_ITINERAIRE_PK                             */
/*==============================================================*/
create unique index APPLI_POINT_ITINERAIRE_PK on APPLI_POINT_ITINERAIRE (
ID_POINT_ITINERAIRE
);

/*==============================================================*/
/* Index: APPLI_COMPOSE_ITINERAIRE_FK                           */
/*==============================================================*/
create  index APPLI_COMPOSE_ITINERAIRE_FK on APPLI_POINT_ITINERAIRE (
ID_TRAJET
);

/*==============================================================*/
/* Index: APPLI_ACTIVITE_ITINIRAIRE_FK                          */
/*==============================================================*/
create  index APPLI_ACTIVITE_ITINIRAIRE_FK on APPLI_POINT_ITINERAIRE (
ID_ACTIVITE
);

/*==============================================================*/
/* Table: APPLI_TRAJET                                          */
/*==============================================================*/
create table APPLI_TRAJET (
ID_TRAJET            INT4                 not null,
CODE_ZONE            TEXT                 not null,
ZON_CODE_ZONE        TEXT                 not null,
ID_DEPLACEMENT       INT4                 not null,
NB_PERSONNE_VEHICULE INT4                 null,
DUREE_RECHERCHE_STATIONNEMENT INT4                 null,
CONFIANCE_MODE_DEPLACEMENT INT4                 null,
COEFFICIENT_REDRESSEMENT FLOAT8               null,
constraint PK_APPLI_TRAJET primary key (ID_TRAJET)
);

/*==============================================================*/
/* Index: APPLI_TRAJET_PK                                       */
/*==============================================================*/
create unique index APPLI_TRAJET_PK on APPLI_TRAJET (
ID_TRAJET
);

/*==============================================================*/
/* Index: APPLI_COMPOSE_DEPLACEMENT_FK                          */
/*==============================================================*/
create  index APPLI_COMPOSE_DEPLACEMENT_FK on APPLI_TRAJET (
ID_DEPLACEMENT
);

/*==============================================================*/
/* Index: ZONE_ORG_TRAJET_FK                                    */
/*==============================================================*/
create  index ZONE_ORG_TRAJET_FK on APPLI_TRAJET (
ZON_CODE_ZONE
);

/*==============================================================*/
/* Index: ZONE_DEST_TRAJET_FK                                   */
/*==============================================================*/
create  index ZONE_DEST_TRAJET_FK on APPLI_TRAJET (
CODE_ZONE
);

/*==============================================================*/
/* Table: APPLI_TRAVAILLE_PCS                                   */
/*==============================================================*/
create table APPLI_TRAVAILLE_PCS (
ID_PERSONNE          INT4                 not null,
CODE_PCS             INT4                 not null,
constraint PK_APPLI_TRAVAILLE_PCS primary key (ID_PERSONNE, CODE_PCS)
);

/*==============================================================*/
/* Index: APPLI_TRAVAILLE_PCS_PK                                */
/*==============================================================*/
create unique index APPLI_TRAVAILLE_PCS_PK on APPLI_TRAVAILLE_PCS (
ID_PERSONNE,
CODE_PCS
);

/*==============================================================*/
/* Index: APPLI_TRAVAILLE_PCS_FK                                */
/*==============================================================*/
create  index APPLI_TRAVAILLE_PCS_FK on APPLI_TRAVAILLE_PCS (
ID_PERSONNE
);

/*==============================================================*/
/* Index: APPLI_TRAVAILLE_PCS2_FK                               */
/*==============================================================*/
create  index APPLI_TRAVAILLE_PCS2_FK on APPLI_TRAVAILLE_PCS (
CODE_PCS
);

/*==============================================================*/
/* Table: APPLI_TYPE_LIEU                                       */
/*==============================================================*/
create table APPLI_TYPE_LIEU (
CODE_TYPE_LIEU       INT4                 not null,
LIBELLE_TYPE_LIEU    TEXT                 null,
constraint PK_APPLI_TYPE_LIEU primary key (CODE_TYPE_LIEU)
);

/*==============================================================*/
/* Index: APPLI_TYPE_LIEU_PK                                    */
/*==============================================================*/
create unique index APPLI_TYPE_LIEU_PK on APPLI_TYPE_LIEU (
CODE_TYPE_LIEU
);

/*==============================================================*/
/* Table: APPLI_UTILISE_MODE                                    */
/*==============================================================*/
create table APPLI_UTILISE_MODE (
CODE_CORRECTION      INT4                 not null,
CODE_APPLI_MODE      INT4                 not null,
constraint PK_APPLI_UTILISE_MODE primary key (CODE_CORRECTION, CODE_APPLI_MODE)
);

/*==============================================================*/
/* Index: APPLI_UTILISE_MODE_PK                                 */
/*==============================================================*/
create unique index APPLI_UTILISE_MODE_PK on APPLI_UTILISE_MODE (
CODE_CORRECTION,
CODE_APPLI_MODE
);

/*==============================================================*/
/* Index: APPLI_UTILISE_MODE_FK                                 */
/*==============================================================*/
create  index APPLI_UTILISE_MODE_FK on APPLI_UTILISE_MODE (
CODE_CORRECTION
);

/*==============================================================*/
/* Index: APPLI_UTILISE_MODE2_FK                                */
/*==============================================================*/
create  index APPLI_UTILISE_MODE2_FK on APPLI_UTILISE_MODE (
CODE_APPLI_MODE
);

/*==============================================================*/
/* Table: CORRECTION_UTILISATEUR                                */
/*==============================================================*/
create table CORRECTION_UTILISATEUR (
CODE_CORRECTION      INT4                 not null,
LIBELLE_CORRECTION   TEXT                 null,
constraint PK_CORRECTION_UTILISATEUR primary key (CODE_CORRECTION)
);

/*==============================================================*/
/* Index: CORRECTION_UTILISATEUR_PK                             */
/*==============================================================*/
create unique index CORRECTION_UTILISATEUR_PK on CORRECTION_UTILISATEUR (
CODE_CORRECTION
);

/*==============================================================*/
/* Table: GOOGLE_MOTIF_DEPLACEMENT                              */
/*==============================================================*/
create table GOOGLE_MOTIF_DEPLACEMENT (
CODE_GOOGLE_MOTIF    INT4                 not null,
CODE_APPLI_MOTIF     INT4                 not null,
LIBELLE_GOOGLE_MOTIF TEXT                 null,
constraint PK_GOOGLE_MOTIF_DEPLACEMENT primary key (CODE_GOOGLE_MOTIF)
);

/*==============================================================*/
/* Index: GOOGLE_MOTIF_DEPLACEMENT_PK                           */
/*==============================================================*/
create unique index GOOGLE_MOTIF_DEPLACEMENT_PK on GOOGLE_MOTIF_DEPLACEMENT (
CODE_GOOGLE_MOTIF
);

/*==============================================================*/
/* Index: APPLI_GOOGLE_FK                                       */
/*==============================================================*/
create  index APPLI_GOOGLE_FK on GOOGLE_MOTIF_DEPLACEMENT (
CODE_APPLI_MOTIF
);

/*==============================================================*/
/* Table: OCCUPATION_PRINCIPALE                                 */
/*==============================================================*/
create table OCCUPATION_PRINCIPALE (
CODE_OCCUPATION      INT4                 not null,
LIBELLE_OCCUPATION   TEXT                 null,
constraint PK_OCCUPATION_PRINCIPALE primary key (CODE_OCCUPATION)
);

/*==============================================================*/
/* Index: OCCUPATION_PRINCIPALE_PK                              */
/*==============================================================*/
create unique index OCCUPATION_PRINCIPALE_PK on OCCUPATION_PRINCIPALE (
CODE_OCCUPATION
);

/*==============================================================*/
/* Table: PERMIS_DE_CONDUIRE                                    */
/*==============================================================*/
create table PERMIS_DE_CONDUIRE (
CODE_PERMIS          INT4                 not null,
LIBELLE_PERMIS       TEXT                 null,
constraint PK_PERMIS_DE_CONDUIRE primary key (CODE_PERMIS)
);

/*==============================================================*/
/* Index: PERMIS_DE_CONDUIRE_PK                                 */
/*==============================================================*/
create unique index PERMIS_DE_CONDUIRE_PK on PERMIS_DE_CONDUIRE (
CODE_PERMIS
);

/*==============================================================*/
/* Table: QUALIFICATION_MOTIF                                   */
/*==============================================================*/
create table QUALIFICATION_MOTIF (
CODE_QUALIFICATION   INT4                 not null,
LABELLE_QUALIFICATION TEXT                 null,
constraint PK_QUALIFICATION_MOTIF primary key (CODE_QUALIFICATION)
);

/*==============================================================*/
/* Index: QUALIFICATION_MOTIF_PK                                */
/*==============================================================*/
create unique index QUALIFICATION_MOTIF_PK on QUALIFICATION_MOTIF (
CODE_QUALIFICATION
);

/*==============================================================*/
/* Table: SEXE                                                  */
/*==============================================================*/
create table SEXE (
CODE_SEXE            INT4                 not null,
LIBELLE_SEXE         TEXT                 null,
constraint PK_SEXE primary key (CODE_SEXE)
);

/*==============================================================*/
/* Index: SEXE_PK                                               */
/*==============================================================*/
create unique index SEXE_PK on SEXE (
CODE_SEXE
);

/*==============================================================*/
/* Table: TC_DEPARTEMENTAL                                      */
/*==============================================================*/
create table TC_DEPARTEMENTAL (
CODE_DEPARTEMENTAL   INT4                 not null,
LIBELLE_DEPARTEMENTAL TEXT                 null,
constraint PK_TC_DEPARTEMENTAL primary key (CODE_DEPARTEMENTAL)
);

/*==============================================================*/
/* Index: TC_DEPARTEMENTAL_PK                                   */
/*==============================================================*/
create unique index TC_DEPARTEMENTAL_PK on TC_DEPARTEMENTAL (
CODE_DEPARTEMENTAL
);

/*==============================================================*/
/* Table: TC_NATIONAL                                           */
/*==============================================================*/
create table TC_NATIONAL (
CODE_NATIONALE       INT4                 not null,
LIBELLE_NATIONALE    TEXT                 null,
constraint PK_TC_NATIONAL primary key (CODE_NATIONALE)
);

/*==============================================================*/
/* Index: TC_NATIONAL_PK                                        */
/*==============================================================*/
create unique index TC_NATIONAL_PK on TC_NATIONAL (
CODE_NATIONALE
);

/*==============================================================*/
/* Table: TC_URBAIN                                             */
/*==============================================================*/
create table TC_URBAIN (
CODE_URBAIN          INT4                 not null,
LIBELLE_URBAIN       TEXT                 null,
constraint PK_TC_URBAIN primary key (CODE_URBAIN)
);

/*==============================================================*/
/* Index: TC_URBAIN_PK                                          */
/*==============================================================*/
create unique index TC_URBAIN_PK on TC_URBAIN (
CODE_URBAIN
);

/*==============================================================*/
/* Table: TC_VELO                                               */
/*==============================================================*/
create table TC_VELO (
CODE_VELO            INT4                 not null,
LIBELLE_VELO         TEXT                 null,
constraint PK_TC_VELO primary key (CODE_VELO)
);

/*==============================================================*/
/* Index: TC_VELO_PK                                            */
/*==============================================================*/
create unique index TC_VELO_PK on TC_VELO (
CODE_VELO
);

/*==============================================================*/
/* Table: TYPE_HABITAT                                          */
/*==============================================================*/
create table TYPE_HABITAT (
CODE_HABITAT         INT4                 not null,
LIBELLE_HABITAT      TEXT                 null,
constraint PK_TYPE_HABITAT primary key (CODE_HABITAT)
);

/*==============================================================*/
/* Index: TYPE_HABITAT_PK                                       */
/*==============================================================*/
create unique index TYPE_HABITAT_PK on TYPE_HABITAT (
CODE_HABITAT
);

/*==============================================================*/
/* Table: VEHICULE                                              */
/*==============================================================*/
create table VEHICULE (
NUM_VEHICULE         INT4                 not null,
ID_MENAGE            INT4                 null,
MARQUE               TEXT                 null,
ANNEE_CIRCULATION    INT4                 null,
PUISSANCE_FISCALE    INT4                 null,
MOTEUR_DEUX_TEMPS    BOOL                 null,
CYLINDREE            INT4                 null,
constraint PK_VEHICULE primary key (NUM_VEHICULE)
);

/*==============================================================*/
/* Index: VEHICULE_PK                                           */
/*==============================================================*/
create unique index VEHICULE_PK on VEHICULE (
NUM_VEHICULE
);

/*==============================================================*/
/* Index: APPLI_DISPOSE_VEHICULE_FK                             */
/*==============================================================*/
create  index APPLI_DISPOSE_VEHICULE_FK on VEHICULE (
ID_MENAGE
);

/*==============================================================*/
/* Table: ZONE_FINE                                             */
/*==============================================================*/
create table ZONE_FINE (
CODE_ZONE            TEXT                 not null,
LIBELLE_ZONE         TEXT                 null,
GEOM                 TEXT                 null,
constraint PK_ZONE_FINE primary key (CODE_ZONE)
);

/*==============================================================*/
/* Index: ZONE_FINE_PK                                          */
/*==============================================================*/
create unique index ZONE_FINE_PK on ZONE_FINE (
CODE_ZONE
);

alter table APPLI_ABONNEMENT_TC
   add constraint FK_APPLI_AB_APPLI_ABO_TC_VELO foreign key (CODE_VELO)
      references TC_VELO (CODE_VELO)
      on delete restrict on update restrict;

alter table APPLI_ABONNEMENT_TC
   add constraint FK_APPLI_AB_APPLI_ABO_TC_NATIO foreign key (CODE_NATIONALE)
      references TC_NATIONAL (CODE_NATIONALE)
      on delete restrict on update restrict;

alter table APPLI_ABONNEMENT_TC
   add constraint FK_APPLI_AB_APPLI_ABO_TC_DEPAR foreign key (CODE_DEPARTEMENTAL)
      references TC_DEPARTEMENTAL (CODE_DEPARTEMENTAL)
      on delete restrict on update restrict;

alter table APPLI_ABONNEMENT_TC
   add constraint FK_APPLI_AB_APPLI_ABO_APPLI_PE foreign key (ID_PERSONNE)
      references APPLI_PERSONNE (ID_PERSONNE)
      on delete restrict on update restrict;

alter table APPLI_ABONNEMENT_TC
   add constraint FK_APPLI_AB_APPLI_ABO_TC_URBAI foreign key (CODE_URBAIN)
      references TC_URBAIN (CODE_URBAIN)
      on delete restrict on update restrict;

alter table APPLI_ADRESSE
   add constraint FK_APPLI_AD_APPLI_LIS_APPLI_PE foreign key (ID_PERSONNE)
      references APPLI_PERSONNE (ID_PERSONNE)
      on delete restrict on update restrict;

alter table APPLI_ADRESSE
   add constraint FK_APPLI_AD_APPLI_TYP_APPLI_TY foreign key (CODE_TYPE_LIEU)
      references APPLI_TYPE_LIEU (CODE_TYPE_LIEU)
      on delete restrict on update restrict;

alter table APPLI_ANIME
   add constraint FK_APPLI_AN_APPLI_ANI_APPLI_PO foreign key (ID_POINT_ARRET)
      references APPLI_POINT_ARRET (ID_POINT_ARRET)
      on delete restrict on update restrict;

alter table APPLI_ANIME
   add constraint FK_APPLI_AN_APPLI_ANI_APPLI_AC foreign key (ID_ACTIVITE)
      references APPLI_ACTIVITE (ID_ACTIVITE)
      on delete restrict on update restrict;

alter table APPLI_DEPLACEMENT
   add constraint FK_APPLI_DE_APPLI_FIC_APPLI_PE foreign key (ID_PERSONNE)
      references APPLI_PERSONNE (ID_PERSONNE)
      on delete restrict on update restrict;

alter table APPLI_DEPLACEMENT
   add constraint FK_APPLI_DE_ZONE_DEST_ZONE_FIN foreign key (CODE_ZONE)
      references ZONE_FINE (CODE_ZONE)
      on delete restrict on update restrict;

alter table APPLI_DEPLACEMENT
   add constraint FK_APPLI_DE_ZONE_ORG__ZONE_FIN foreign key (ZON_CODE_ZONE)
      references ZONE_FINE (CODE_ZONE)
      on delete restrict on update restrict;

alter table APPLI_MENAGE
   add constraint FK_APPLI_ME_HABITE_LO_TYPE_HAB foreign key (CODE_HABITAT)
      references TYPE_HABITAT (CODE_HABITAT)
      on delete restrict on update restrict;

alter table APPLI_MOTIF
   add constraint FK_APPLI_MO_APPLI_MOT_QUALIFIC foreign key (CODE_QUALIFICATION)
      references QUALIFICATION_MOTIF (CODE_QUALIFICATION)
      on delete restrict on update restrict;

alter table APPLI_MOTIF
   add constraint FK_APPLI_MO_APPLI_MOT_APPLI_DE foreign key (ID_DEPLACEMENT)
      references APPLI_DEPLACEMENT (ID_DEPLACEMENT)
      on delete restrict on update restrict;

alter table APPLI_MOTIF
   add constraint FK_APPLI_MO_APPLI_MOT_CORRECTI foreign key (CODE_CORRECTION)
      references CORRECTION_UTILISATEUR (CODE_CORRECTION)
      on delete restrict on update restrict;

alter table APPLI_MOTIF
   add constraint FK_APPLI_MO_APPLI_MOT_APPLI_MO foreign key (CODE_APPLI_MOTIF)
      references APPLI_MOTIF_DEPLACEMENT (CODE_APPLI_MOTIF)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APLLI_FRE_APPLI_FR foreign key (CODE_FREQUENCE_USAGE)
      references APPLI_FREQUENCE_USAGE (CODE_FREQUENCE_USAGE)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APPLI_EST_SEXE foreign key (CODE_SEXE)
      references SEXE (CODE_SEXE)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APPLI_EST_PERMIS_D foreign key (CODE_PERMIS)
      references PERMIS_DE_CONDUIRE (CODE_PERMIS)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APPLI_FIC_APPLI_ME foreign key (ID_MENAGE)
      references APPLI_MENAGE (ID_MENAGE)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APPLI_NIV_APPLI_ET foreign key (CODE_ETABLISSAMENT)
      references APPLI_ETABLISSEMENT_SCOLAIRE (CODE_ETABLISSAMENT)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_APPLI_TRA_OCCUPATI foreign key (CODE_OCCUPATION)
      references OCCUPATION_PRINCIPALE (CODE_OCCUPATION)
      on delete restrict on update restrict;

alter table APPLI_PERSONNE
   add constraint FK_APPLI_PE_VEHICULE__VEHICULE foreign key (NUM_VEHICULE)
      references VEHICULE (NUM_VEHICULE)
      on delete restrict on update restrict;

alter table APPLI_POINT_ARRET
   add constraint FK_APPLI_PO_APPLI_COM_APPLI_DE foreign key (ID_DEPLACEMENT)
      references APPLI_DEPLACEMENT (ID_DEPLACEMENT)
      on delete restrict on update restrict;

alter table APPLI_POINT_ITINERAIRE
   add constraint FK_APPLI_PO_APPLI_ACT_APPLI_AC foreign key (ID_ACTIVITE)
      references APPLI_ACTIVITE (ID_ACTIVITE)
      on delete restrict on update restrict;

alter table APPLI_POINT_ITINERAIRE
   add constraint FK_APPLI_PO_APPLI_COM_APPLI_TR foreign key (ID_TRAJET)
      references APPLI_TRAJET (ID_TRAJET)
      on delete restrict on update restrict;

alter table APPLI_TRAJET
   add constraint FK_APPLI_TR_APPLI_COM_APPLI_DE foreign key (ID_DEPLACEMENT)
      references APPLI_DEPLACEMENT (ID_DEPLACEMENT)
      on delete restrict on update restrict;

alter table APPLI_TRAJET
   add constraint FK_APPLI_TR_ZONE_DEST_ZONE_FIN foreign key (CODE_ZONE)
      references ZONE_FINE (CODE_ZONE)
      on delete restrict on update restrict;

alter table APPLI_TRAJET
   add constraint FK_APPLI_TR_ZONE_ORG__ZONE_FIN foreign key (ZON_CODE_ZONE)
      references ZONE_FINE (CODE_ZONE)
      on delete restrict on update restrict;

alter table APPLI_TRAVAILLE_PCS
   add constraint FK_APPLI_TR_APPLI_TRA_APPLI_PE foreign key (ID_PERSONNE)
      references APPLI_PERSONNE (ID_PERSONNE)
      on delete restrict on update restrict;

alter table APPLI_TRAVAILLE_PCS
   add constraint FK_APPLI_TR_APPLI_TRA_APPLI_CO foreign key (CODE_PCS)
      references APPLI_CODIFICATION_PCS (CODE_PCS)
      on delete restrict on update restrict;

alter table APPLI_UTILISE_MODE
   add constraint FK_APPLI_UT_APPLI_UTI_CORRECTI foreign key (CODE_CORRECTION)
      references CORRECTION_UTILISATEUR (CODE_CORRECTION)
      on delete restrict on update restrict;

alter table APPLI_UTILISE_MODE
   add constraint FK_APPLI_UT_APPLI_UTI_APPLI_MO foreign key (CODE_APPLI_MODE)
      references APPLI_MODE_DEPLACEMENT (CODE_APPLI_MODE)
      on delete restrict on update restrict;

alter table GOOGLE_MOTIF_DEPLACEMENT
   add constraint FK_GOOGLE_M_APPLI_GOO_APPLI_MO foreign key (CODE_APPLI_MOTIF)
      references APPLI_MOTIF_DEPLACEMENT (CODE_APPLI_MOTIF)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_APPLI_DIS_APPLI_ME foreign key (ID_MENAGE)
      references APPLI_MENAGE (ID_MENAGE)
      on delete restrict on update restrict;
