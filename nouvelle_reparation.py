import streamlit as st
from db import get_connection

def app():
    st.title("➕ Ajouter une nouvelle réparation")

    with st.form("form_reparation"):
        type_appareil = st.selectbox("Type d'appareil", ["Téléphone", "Tablette", "PC", "PlayStation", "Autre"])
        os = st.selectbox("Système d'exploitation", ["Android", "iOS", "Windows", "Linux", "Autre"])
        modele = st.text_input("Modèle de l'appareil")
        panne = st.text_area("Description de la panne")

        montant_total = st.number_input("Montant total (TND)", min_value=0.0, step=1.0)
        acompte = st.number_input("Acompte versé (TND)", min_value=0.0, step=1.0)
        paiement_effectue = st.radio("Paiement effectué ?", ["Oui", "Non"])
        type_paiement = st.selectbox("Type de paiement", ["Espèces", "Carte", "Virement", "Autre"])

        submit = st.form_submit_button("💾 Enregistrer")

    if submit:
        try:
            conn = get_connection()
            cursor = conn.cursor()

            insert_query = """
            INSERT INTO reparations (
                type_appareil, os, panne, modele,
                montant_total, acompte, paiement_effectue, type_paiement
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                type_appareil, os, panne, modele,
                montant_total, acompte,
                True if paiement_effectue == "Oui" else False,
                type_paiement
            )
            cursor.execute(insert_query, values)
            conn.commit()

            dernier_id = cursor.lastrowid
            code_reparation = f"R-{dernier_id:07d}"

            update_query = "UPDATE reparations SET code_reparation = %s WHERE id = %s"
            cursor.execute(update_query, (code_reparation, dernier_id))
            conn.commit()

            st.success(f"✅ Réparation enregistrée avec le code **{code_reparation}**")
        
        except Exception as e:
            st.error(f"❌ Erreur lors de l'enregistrement : {e}")
        
        finally:
            cursor.close()
            conn.close()
