# Implementation Plan - Fix Search Screen

The current `SearchScreen` is partially implemented and contains compilation errors. It lacks search logic and is not connected to the `DoctorBloc`.

## User Review Required

> [!IMPORTANT]
> The `SearchScreen` currently uses `DrRecommendationWidget` which requires a `List<DoctorModel>`. I will integrate `DoctorBloc` to provide this data and handle search/filter events.

## Proposed Changes

### Search Feature

#### [MODIFY] [search_screen.dart](file:///E:/AMIT/doctor/lib/features/search/screens/search_screen.dart)
- Integrate `DoctorBloc` using `BlocBuilder`.
- Add a `TextEditingController` to handle search input.
- Dispatch `SearchDoctorsEvent` on input changes.
- Fix the `DrRecommendationWidget` call by passing the doctors list from the BLoC state.
- Add UI feedback for loading, empty results, and errors.
- Add a clear button to the search field.
- Update the app bar title to "Search Doctor".

## Verification Plan

### Manual Verification
- Navigate to the Search screen.
- Verify that a list of doctors is displayed initially (or after searching).
- Enter text in the search bar and verify that the results are filtered.
- Click the clear button and verify the search input is cleared.
- Verify that loading indicators and error messages (if any) are displayed correctly.
