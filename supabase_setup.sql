create table if not exists public.canteen_app_state (
  id text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.canteen_app_users (
  username text primary key,
  identity text not null,
  password text not null,
  created_at timestamptz not null default timezone('utc', now())
);

alter table public.canteen_app_state enable row level security;
alter table public.canteen_app_users enable row level security;

drop policy if exists "allow public read state" on public.canteen_app_state;
drop policy if exists "allow public insert state" on public.canteen_app_state;
drop policy if exists "allow public update state" on public.canteen_app_state;
drop policy if exists "allow public read users" on public.canteen_app_users;
drop policy if exists "allow public insert users" on public.canteen_app_users;

create policy "allow public read state"
on public.canteen_app_state
for select
to anon, authenticated
using (true);

create policy "allow public insert state"
on public.canteen_app_state
for insert
to anon, authenticated
with check (true);

create policy "allow public update state"
on public.canteen_app_state
for update
to anon, authenticated
using (true)
with check (true);

create policy "allow public read users"
on public.canteen_app_users
for select
to anon, authenticated
using (true);

create policy "allow public insert users"
on public.canteen_app_users
for insert
to anon, authenticated
with check (true);
