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
- [Historia commitów](#historia-commitów)

---

## Opis projektu

Geo Journal to aplikacja mobilna napisana w Flutterze, umożliwiająca prowadzenie dziennika wpisów powiązanych z lokalizacją lub zdjęciem. Użytkownik może przeglądać wpisy na liście lub mapie, dodawać nowe wpisy z wykorzystaniem natywnych funkcji urządzenia oraz przeglądać szczegóły każdego wpisu. Dane są synchronizowane z API.

## Funkcjonalności (Obecne)

- Wyświetlanie listy wpisów (obecnie dane statyczne).
- Interfejs dodawania nowego wpisu (formularz z walidacją, symulacja zapisu).
- Przeglądanie szczegółów wpisu (tytuł, opis, data).
- Podstawowa nawigacja między ekranami.

## Widoki

1. **Lista wpisów** – wyświetla listę wpisów (obecnie jeden wpis testowy).
2. **Szczegóły wpisu** – prezentuje szczegóły wybranego wpisu.
3. **Dodaj wpis** – formularz umożliwiający wpisanie tytułu i opisu.

## Funkcje natywne

- Przygotowany model danych pod obsługę lokalizacji i zdjęć (funkcjonalność niezaimplementowana w widokach).

## Komunikacja z API

- Brak (aplikacja korzysta z lokalnych, statycznych danych).

## Stany aplikacji

- **Ładowanie** – wyświetlany spinner podczas pobierania danych
- **Błąd** – komunikat o błędzie w przypadku problemów z API lub uprawnieniami
- **Pusty** – informacja o braku wpisów

## Uruchomienie

1. Zainstaluj Flutter SDK: https://docs.flutter.dev/get-started/install
2. Przejdź do katalogu `geo_journal`
3. Zainstaluj zależności: `flutter pub get`
4. Uruchom aplikację na emulatorze lub urządzeniu: `flutter run`
5. (Opcjonalnie) Skonfiguruj własne API w pliku `api_service.dart`

## Zrzuty ekranu

> Przykładowe ekrany aplikacji (dodaj własne po uruchomieniu):

![Lista wpisów](assets/screens/lista.png)
![Dodaj wpis](assets/screens/dodaj.png)
![Szczegóły wpisu](assets/screens/szczegoly.png)
![Mapa wpisów](assets/screens/mapa.png)

## Wymagania zadania (DoD)

- [ ] 3–4 widoki, kompletna nawigacja
- [ ] Co najmniej 1 natywna funkcja (GPS lub aparat)
- [ ] Co najmniej 1 operacja API (GET/POST)
- [ ] Stany: ładowanie, błąd, pusty
- [ ] README.md, zrzuty ekranów, min. 3 commity
