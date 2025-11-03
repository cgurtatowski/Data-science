import pandas as pd

# Charger les données
data = pd.read_csv('tracks.csv')

# 1. Top 10 des artistes par popularité moyenne
top_artistes = data.groupby('artists')['popularity'].mean().sort_values(ascending=False).head(10)
print("Top 10 des artistes par popularité moyenne :")
print(top_artistes)

# 2. Durée moyenne des morceaux par genre (en minutes)
duree_par_genre = data.groupby('track_genre')['duration_ms'].mean() / 60000
print("\nDurée moyenne des morceaux par genre (en minutes) :")
print(duree_par_genre)

# 3. Top 5 des genres par énergie moyenne
top_genre_energie = data.groupby('track_genre')['energy'].mean().sort_values(ascending=False).head(5)
print("\nTop 5 des genres par énergie moyenne :")
print(top_genre_energie)

# 4. Tempo moyen par genre (en BPM)
tempo_par_genre = data.groupby('track_genre')['tempo'].mean()
print("\nTempo moyen par genre (en BPM) :")
print(tempo_par_genre)