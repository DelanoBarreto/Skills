# PortalGov UI Patterns

Use these patterns when building or reviewing PortalGov pages.

## Internal Pages

- Use `InternalPageShell` for title, highlight, description, icon, banner, and breadcrumbs.
- Use dynamic metadata maps for pages where filters change the page context, such as LRF/RREO/RGF.
- Keep internal pages functional and dense: clear title, compact filters, readable data lists/tables.
- Prefer top filter bars for common filters and side panels only when the filter set is large.

## Radius Tokens

| Context | Radius |
| --- | --- |
| Home components | `rounded-md` / 8px |
| Internal pages and dashboards | `rounded-sm` or `rounded` / 6px |
| Tags, badges, utility icons | 4px scale |

Do not use `rounded-[32px]`, `rounded-3xl`, or pill-shaped `rounded-full` as the default PortalGov style.

## Buttons And Inputs

- Buttons: compact height, clear icon when useful, `cursor-pointer`, visible focus state.
- Filters: light backgrounds, subtle borders, no saturated solid color as default inactive state.
- Inputs: accessible label or `aria-label`, visible focus ring, stable layout on hover/focus.

## Data Cards And Tables

- Prioritize scanability over decorative depth.
- Use subtle borders, restrained shadows, and tenant accent only for active/selected states.
- Data modules should expose updated date, filters, and export actions when relevant to PNTP.

## Responsive Behavior

- Mobile: one column, no horizontal overflow.
- Desktop: use 12-column grids or existing section layout conventions.
- Preserve touch targets around 44px when controls are used on mobile.
