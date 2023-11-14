import tkinter as tk
from tkinter import ttk
import serial.tools.list_ports
import serial
import time
from datetime import datetime

class ESPControlGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("ESP Control")
        self.serial_port = None

        # Dropdown für COM-Ports
        self.port_label = ttk.Label(root, text="Select COM Port:")
        self.port_combobox = ttk.Combobox(root, values=self.get_serial_ports())
        self.port_combobox.set("Select Port")
        self.port_label.pack(pady=10)
        self.port_combobox.pack(pady=10)

        # Verbinden-Button
        self.connect_button = ttk.Button(root, text="Connect", command=self.connect_to_esp)
        self.connect_button.pack(pady=10)

        # Zeit anzeigen
        self.time_label = ttk.Label(root, text="Time: ")
        self.time_label.pack(pady=10)

        # Sync Time Button
        self.sync_time_button = ttk.Button(root, text="Sync Time", command=self.sync_time_with_esp)
        self.sync_time_button.pack(pady=10)

        # Dropdown-Menü für Teamnamen aus teams.csv
        self.team_names = self.read_team_names_from_csv()
        self.team_label = ttk.Label(root, text="Select Team:")
        self.team_combobox = ttk.Combobox(root, values=self.team_names)
        self.team_combobox.set("Select Team")
        self.team_label.pack(pady=10)
        self.team_combobox.pack(pady=10)

        # Get ID Button
        self.get_id_button = ttk.Button(root, text="Get ID", command=self.get_id_from_esp)
        self.get_id_button.pack(pady=10)

        # Funktionen alle 2 Sekunden aufrufen
        self.root.after(2000, self.get_time_from_esp)

    def get_serial_ports(self):
        return [port.device for port in serial.tools.list_ports.comports()]

    def connect_to_esp(self):
        selected_port = self.port_combobox.get()
        if selected_port:
            self.serial_port = serial.Serial(selected_port, 115200, timeout=1)
            print(f"Connected to {selected_port}")
        else:
            print("No COM Port selected")

    def read_team_names_from_csv(self):
        # Hier implementierst du den Code zum Lesen der Teamnamen aus der teams.csv-Datei
        # Beispiel: teams.csv enthält pro Zeile einen Teamnamen
        return ["Team1", "Team2", "Team3"]  # Dummy-Werte, ersetze dies durch den tatsächlichen Code

    def get_time_from_esp(self):
        if self.serial_port:
            # Sende "get_time" an den ESP
            self.serial_port.write(b"get_time\n")
            # Warte auf Antwort (einfache Implementierung, keine Fehlerüberprüfung)
            time_data = self.serial_port.readline().decode("utf-8").strip()
            # Zeige die Zeit in der GUI an
            self.time_label.config(text=f"Time: {time_data}")
        # Funktion in 2 Sekunden wieder aufrufen
        self.root.after(2000, self.get_time_from_esp)

    def sync_time_with_esp(self):
        if self.serial_port:
            # Sende "sync_time" an den ESP
            self.serial_port.write(b"sync_time\n")
            # Warte auf Antwort (einfache Implementierung, keine Fehlerüberprüfung)
            # Sende dann die aktuelle PC-Zeit im Format "hh:mm:ss" an den ESP
            current_time = datetime.now().strftime("%H:%M:%S")
            self.serial_port.write(current_time.encode("utf-8"))
            print(f"Synced time with ESP: {current_time}")

    def get_id_from_esp(self):
        if self.serial_port:
            team_name = self.team_combobox.get()
            if team_name != "Select Team":
                # Sende "set_ID" an den ESP
                self.serial_port.write(b"set_ID\n")
                time.sleep(0.1)  # Warte 100 Millisekunden
                # Warte auf Antwort (einfache Implementierung, keine Fehlerüberprüfung)
                response = self.serial_port.readline().decode("utf-8").strip()
                if response == "Ready to scan":
                    # Hier könntest du eine Statusanzeige für den Scanvorgang aktivieren
                    print(f"Scanning for ID for Team: {team_name}")
                    # TODO: Implementiere den Empfang der ID vom ESP
                    # Wenn ID empfangen wurde, deaktiviere die Statusanzeige
                else:
                    print("Unexpected response from ESP")

if __name__ == "__main__":
    root = tk.Tk()
    gui = ESPControlGUI(root)
    root.mainloop()