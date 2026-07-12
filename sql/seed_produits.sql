-- ── SEED PRODUITS : 110 Street ──────────────────────────────
INSERT INTO public.restaurants (nom, slug)
VALUES ('110 Street', '110street')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE rid UUID;
BEGIN
  SELECT id INTO rid FROM public.restaurants WHERE slug = '110street';
  INSERT INTO public.produits (restaurant_id, nom, description, prix, categorie, disponible) VALUES
    (rid, 'Classic Burger', 'Steak boeuf, salade, tomate, oignons, sauce 110', 8.00, 'Burgers', true),
    (rid, 'Cheese Burger Chicken', 'Filet poulet croustillant, cheddar, sauce maison', 9.00, 'Burgers', true),
    (rid, 'Cheese Burger Beef', 'Double cheddar, steak boeuf, cornichons', 10.00, 'Burgers', true),
    (rid, 'Double Smash Burger', 'Double patty boeuf, sauce speciale, fromage', 13.00, 'Burgers', true),
    (rid, 'Spicy Burger', 'Steak epice, jalapeños, sauce piquante', 9.50, 'Burgers', true),
    (rid, 'Veggie Burger', 'Galette legumes, avocat, sauce yaourt', 9.00, 'Burgers', true),
    (rid, 'Club Sandwich', 'Poulet, bacon, oeuf, tomate, laitue, mayo', 9.00, 'Sandwichs', true),
    (rid, 'Sandwich Poulet Grille', 'Filet poulet, legumes, sauce moutarde', 7.00, 'Sandwichs', true),
    (rid, 'Sandwich Thon', 'Thon, mayo, salade, tomate', 7.00, 'Sandwichs', true),
    (rid, 'Wrap Vegetarien', 'Legumes grilles, houmous, roquette', 8.00, 'Sandwichs', true),
    (rid, 'Salade Cesar', 'Poulet grille, parmesan, croutons, sauce Cesar', 9.00, 'Salades', true),
    (rid, 'Salade Grecque', 'Feta, olives, tomates, concombre, oignons', 9.00, 'Salades', true),
    (rid, 'Salade Nicoise', 'Thon, oeufs, olives, anchois, tomates', 10.00, 'Salades', true),
    (rid, 'Salade Avocat-Crevettes', 'Avocat, crevettes, mangue, citron', 12.00, 'Salades', true),
    (rid, 'Pates Alfredo', 'Creme, parmesan, ail, basilic', 12.00, 'Plats', true),
    (rid, 'Poulet Sauce Curry', 'Filet poulet, sauce curry cremeuse, riz', 14.00, 'Plats', true),
    (rid, 'Steak Frites', 'Entrecote 250g, frites maison, salade', 18.00, 'Plats', true),
    (rid, 'Fish and Chips', 'Filet de poisson pane, frites, sauce tartare', 14.00, 'Plats', true),
    (rid, 'Brownie Chocolat', 'Fondant aux noix, glace vanille', 6.00, 'Desserts', true),
    (rid, 'Glace 2 boules', 'Vanille, chocolat ou fraise', 4.00, 'Desserts', true),
    (rid, 'Cheesecake Maison', 'Base biscuit, coulis de fruits rouges', 7.00, 'Desserts', true),
    (rid, 'Coca Cola 33cl', NULL, 2.50, 'Boissons', true),
    (rid, 'Fanta ou Sprite 33cl', NULL, 2.50, 'Boissons', true),
    (rid, 'Milkshake', 'Vanille, chocolat ou fraise', 5.00, 'Boissons', true),
    (rid, 'Jus de Fruit Frais', 'Mangue, passion, orange', 4.00, 'Boissons', true),
    (rid, 'Biere Importee 33cl', NULL, 5.00, 'Boissons', true),
    (rid, 'Eau Minerale 75cl', NULL, 2.00, 'Boissons', true)
  ON CONFLICT DO NOTHING;
END $$;
