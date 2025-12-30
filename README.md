# Geo Journal

> Aplikacja Flutter do prowadzenia dziennika lokalizacji z natywną funkcją GPS/aparatu oraz komunikacją z API.

---

## Spis treści

- [Opis projektu](#opis-projektu)
- [Funkcjonalności](#funkcjonalności)
- [Widoki](#widoki)
- [Funkcje natywne](#funkcje-natywne)
- [Komunikacja z API](#komunikacja-z-api)
- [Uruchomienie](#uruchomienie)
- [Wymagania zadania (DoD)](#wymagania-zadania-dod)

---

## Opis projektu

Geo Journal to aplikacja mobilna napisana w Flutterze, umożliwiająca prowadzenie dziennika wpisów powiązanych z lokalizacją lub zdjęciem. Użytkownik może przeglądać wpisy na liście, dodawać nowe wpisy z wykorzystaniem natywnych funkcji urządzenia oraz przeglądać szczegóły każdego wpisu. Dane są synchronizowane z API.

## Funkcjonalności

- **Przeglądanie wpisów** – Lista wpisów z tytułem, opisem i datą.
- **Dodawanie wpisu** – Formularz z walidacją, obsługą GPS i aparatu.
- **Szczegóły wpisu** – Pełny widok pojedynczego wpisu.
- **Nawigacja** – Przejścia między ekranami.
- **Stany aplikacji** – Obsługa ładowania, błędów i pustej listy.

## Widoki

1. **Lista wpisów** – Wyświetla listę dodanych wpisów. Obsługuje stany ładowania i błędów.
2. **Szczegóły wpisu** – Prezentuje szczegóły wybranego wpisu (tytuł, opis, data, lokalizacja, zdjęcie).
3. **Dodaj wpis** – Formularz umożliwiający dodanie nowego wpisu. Zintegrowany z modułami GPS i aparatu.

## Funkcje natywne

### 1. GPS / Geolokalizacja

Aplikacja pozwala na pobranie aktualnej lokalizacji użytkownika podczas dodawania wpisu.

- Wykorzystuje pakiet `geolocator`.
- Obsługuje uprawnienia i błędy lokalizacji.

### 2. Aparat / Galeria

Użytkownik może dodać zdjęcie do wpisu, wykonując je aparatem lub wybierając z galerii.

- Wykorzystuje pakiet `image_picker`.

## Komunikacja z API

Aplikacja posiada warstwę serwisową do komunikacji z API (`ApiService`).

- **Pobieranie wpisów (GET)** – Symulowane pobieranie listy wpisów.
- **Dodawanie wpisu (POST)** – Symulowane wysyłanie nowego wpisu.

## Uruchomienie

1. Zainstaluj Flutter SDK.
2. Przejdź do katalogu projektu.
3. Zainstaluj zależności: `flutter pub get`
4. Uruchom aplikację: `flutter run`

## Wymagania zadania (DoD)

- [x] 3–4 widoki, kompletna nawigacja
- [x] Co najmniej 1 natywna funkcja (GPS i aparat)
- [x] Co najmniej 1 operacja API (GET/POST)
- [x] Stany: ładowanie, błąd, pusty
- [x] README.md, min. 3 commity
