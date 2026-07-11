-- PARAMÈTRES RESTAURANT 110 Street
CREATE TABLE IF NOT EXISTS public.parametres (
  id             INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  nom_restaurant TEXT DEFAULT '110 Street',
  logo_url       TEXT,
  adresse        TEXT DEFAULT 'Kinshasa, RDC',
  telephone      TEXT DEFAULT '+243 900 000 000',
  whatsapp       TEXT DEFAULT '243900000000',
  horaires       TEXT DEFAULT 'Tous les jours 11h00 - 23h00',
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);
INSERT INTO public.parametres (id, nom_restaurant, adresse, telephone, whatsapp, horaires)
VALUES (1, '110 Street', 'Kinshasa, RDC', '+243 900 000 000', '243900000000', 'Tous les jours 11h00 - 23h00')
ON CONFLICT (id) DO NOTHING;
CREATE TRIGGER trg_parametres_updated_at BEFORE UPDATE ON public.parametres FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
ALTER TABLE public.parametres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "param_select" ON public.parametres FOR SELECT USING (true);
CREATE POLICY "param_update" ON public.parametres FOR UPDATE USING (auth.uid() IN (SELECT id FROM public.admin_profiles));
SELECT '110 Street — paramètres OK' AS status;
