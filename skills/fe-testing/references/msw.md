# MSW

- Handlers live beside feature `api/` or central `mocks/` per binding.
- Return shapes that match **generated API types**, not hand-rolled divergent JSON.
- Reset handlers between tests; assert loading/error paths for mutations.