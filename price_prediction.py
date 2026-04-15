import pandas as pd
from sklearn.linear_model import LinearRegression

data = pd.read_csv("ola_ai_dataset.csv")

data['vehicle_type'] = data['vehicle_type'].map({
    'Auto': 1, 'Mini': 2, 'Sedan': 3, 'SUV': 4
})

X = data[['distance_km', 'duration_min', 'vehicle_type']]
y = data['total_price']

model = LinearRegression()
model.fit(X, y)

distance = float(input("Enter distance (km): "))
duration = float(input("Enter duration (min): "))
vehicle = int(input("Vehicle (1=Auto,2=Mini,3=Sedan,4=SUV): "))

prediction = model.predict([[distance, duration, vehicle]])

print("🚖 Predicted Price:", round(prediction[0], 2))

data['predicted_price'] = model.predict(X)

data['difference'] = data['total_price'] - data['predicted_price']

data.to_csv("ola_with_predictions.csv", index=False)

print("✅ New dataset created: ola_with_predictions.csv")