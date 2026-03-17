-- Run this in Supabase SQL Editor

DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS blogs;
DROP TABLE IF EXISTS hospitals;
DROP TABLE IF EXISTS cancer_types;

CREATE TABLE IF NOT EXISTS cancer_types (
    id TEXT NOT NULL,
    lang TEXT NOT NULL DEFAULT 'en',
    name TEXT NOT NULL,
    description TEXT,
    symptoms TEXT,
    treatments TEXT,
    image_url TEXT,
    PRIMARY KEY (id, lang)
);

CREATE TABLE IF NOT EXISTS hospitals (
    id TEXT NOT NULL,
    lang TEXT NOT NULL DEFAULT 'en',
    name TEXT NOT NULL,
    address TEXT,
    phone TEXT,
    description TEXT,
    image_url TEXT,
    rating FLOAT,
    specialties TEXT[],
    PRIMARY KEY (id, lang)
);

CREATE TABLE IF NOT EXISTS blogs (
    id TEXT NOT NULL,
    lang TEXT NOT NULL DEFAULT 'en',
    title TEXT NOT NULL,
    author TEXT,
    content TEXT,
    image_url TEXT,
    date TIMESTAMPTZ,
    category TEXT,
    PRIMARY KEY (id, lang)
);

CREATE TABLE IF NOT EXISTS treatments (
    id TEXT NOT NULL,
    lang TEXT NOT NULL DEFAULT 'en',
    name TEXT NOT NULL,
    description TEXT,
    procedure_steps TEXT,
    side_effects TEXT,
    recovery TEXT,
    image_url TEXT,
    applicable_cancers TEXT[],
    PRIMARY KEY (id, lang)
);

-- =====================
-- SEED: Cancer Types (EN)
-- =====================
INSERT INTO cancer_types (id, lang, name, description, symptoms, treatments, image_url) VALUES
('1','en','Lung Cancer','Lung cancer is a type of cancer that begins in the lungs. Your lungs are two spongy organs in your chest that take in oxygen when you inhale and release carbon dioxide when you exhale. It is the leading cause of cancer deaths worldwide.','• A new cough that doesn''t go away\n• Coughing up blood, even a small amount\n• Shortness of breath\n• Chest pain\n• Hoarseness\n• Losing weight without trying\n• Bone pain\n• Headache','Treatments vary but may include surgery, chemotherapy, radiation therapy, targeted drug therapy, and immunotherapy.','https://images.unsplash.com/photo-1559757175-5700dde675bc?auto=format&fit=crop&q=80&w=800'),
('2','en','Breast Cancer','Breast cancer is cancer that forms in the cells of the breasts. After skin cancer, breast cancer is the most common cancer diagnosed in women in the United States.','• A breast lump or thickening that feels different from the surrounding tissue\n• Change in the size, shape or appearance of a breast\n• Changes to the skin over the breast, such as dimpling\n• A newly inverted nipple\n• Peeling, scaling, crushing or flaking of the pigmented area of skin surrounding the nipple (areola) or breast skin','Surgery, chemotherapy, radiation therapy, hormone therapy, and targeted therapy.','https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?auto=format&fit=crop&q=80&w=800'),
('3','en','Colorectal Cancer','Colon cancer is a type of cancer that begins in the large intestine (colon). The colon is the final part of the digestive tract. It typically affects older adults, though it can happen at any age.','• A persistent change in your bowel habits, including diarrhea or constipation or a change in the consistency of your stool\n• Rectal bleeding or blood in your stool\n• Persistent abdominal discomfort, such as cramps, gas or pain\n• A feeling that your bowel does not empty completely\n• Weakness or fatigue\n• Unexplained weight loss','Surgery is the most common treatment. Other options include chemotherapy, radiation therapy, and targeted drug therapy.','https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&q=80&w=800'),
('4','en','Prostate Cancer','Prostate cancer is cancer that occurs in the prostate. The prostate is a small walnut-shaped gland in males that produces the seminal fluid that nourishes and transports sperm.','• Trouble urinating\n• Decreased force in the stream of urine\n• Blood in the urine\n• Blood in the semen\n• Bone pain\n• Losing weight without trying\n• Erectile dysfunction','Surgery, radiation therapy, hormone therapy, chemotherapy, and immunotherapy.','https://images.unsplash.com/photo-1584362917165-526a968579e8?auto=format&fit=crop&q=80&w=800'),
('5','en','Liver Cancer','Liver cancer is cancer that begins in the cells of your liver. The most common form is hepatocellular carcinoma.','• Losing weight without trying\n• Loss of appetite\n• Upper abdominal pain\n• Nausea and vomiting\n• General weakness and fatigue\n• Abdominal swelling\n• Yellow discoloration of your skin and the whites of your eyes (jaundice)\n• White, chalky stools','Surgery (partial hepatectomy or liver transplant), localized treatments, radiation therapy, targeted drug therapy, immunotherapy, and chemotherapy.','https://images.unsplash.com/photo-1581594294883-5109c202942f?q=80&w=1760&auto=format&fit=crop'),
('6','en','Stomach (Gastric) Cancer','Stomach cancer, also known as gastric cancer, is an abnormal growth of cells that begins in the stomach.','• Difficulty swallowing\n• Feeling bloated after eating\n• Feeling full after eating small amounts of food\n• Heartburn\n• Indigestion\n• Nausea\n• Stomach pain\n• Unintentional weight loss\n• Vomiting','Surgery, chemotherapy, radiation therapy, targeted therapy, and immunotherapy.','https://images.unsplash.com/photo-1511174511562-5f7f18b874f8?auto=format&fit=crop&q=80&w=800'),
('7','en','Cervical Cancer','Cervical cancer is a type of cancer that occurs in the cells of the cervix. Various strains of HPV play a role in causing most cases.','• Vaginal bleeding after intercourse, between periods or after menopause\n• Watery, bloody vaginal discharge that may be heavy and have a foul odor\n• Pelvic pain or pain during intercourse','Surgery, radiation therapy, chemotherapy, and targeted therapy.','https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&q=80&w=800'),
('8','en','Oral Cancer','Oral cancer refers to cancer that develops in any of the parts that make up the mouth.','• A sore that doesn''t heal\n• A patch of white or red skin on the inside of your mouth\n• Loose teeth\n• A growth or lump inside your mouth\n• Mouth pain\n• Ear pain\n• Difficult or painful swallowing','Surgery, radiation therapy, and chemotherapy.','https://images.unsplash.com/photo-1559757175-5700dde675bc?auto=format&fit=crop&q=80&w=800'),
('9','en','Ovarian Cancer','Ovarian cancer is a growth of cells that forms in the ovaries. The cells multiply quickly and can invade and destroy healthy body tissue.','• Abdominal bloating or swelling\n• Quickly feeling full when eating\n• Weight loss\n• Discomfort in the pelvic area\n• Fatigue\n• Back pain\n• Changes in bowel habits, such as constipation','Surgery and chemotherapy are the main treatments.','https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?auto=format&fit=crop&q=80&w=800'),
('10','en','Leukemia','Leukemia is cancer of the body''s blood-forming tissues, including the bone marrow and the lymphatic system.','• Fever or chills\n• Persistent fatigue, weakness\n• Frequent or severe infections\n• Losing weight without trying\n• Swollen lymph nodes\n• Easy bleeding or bruising\n• Recurrent nosebleeds\n• Tiny red spots in your skin (petechiae)','Chemotherapy, targeted therapy, radiation therapy, bone marrow transplant, and immunotherapy.','https://images.unsplash.com/photo-1530026405186-ed1f139313f8?auto=format&fit=crop&q=80&w=800'),
('11','en','Skin Cancer (Melanoma)','Melanoma, the most serious type of skin cancer, develops in the cells (melanocytes) that produce melanin.','• A change in an existing mole\n• The development of a new pigmented or unusual-looking growth on your skin\n• Asymmetrical moles\n• Irregular borders\n• Changes in color\n• Diameter larger than a pencil eraser','Surgery to remove the tumor is the primary treatment.','https://images.unsplash.com/photo-1584362917165-526a968579e8?auto=format&fit=crop&q=80&w=800'),
('12','en','Pancreatic Cancer','Pancreatic cancer begins in the tissues of your pancreas. The pancreas releases enzymes that aid digestion and produces hormones that help manage your blood sugar.','• Abdominal pain that radiates to your back\n• Loss of appetite or unintended weight loss\n• Yellowing of your skin and the whites of your eyes (jaundice)\n• Light-colored stools\n• Dark-colored urine\n• Itchy skin','Surgery, chemotherapy, and radiation therapy.','https://images.unsplash.com/photo-1628771065518-0d82f1938462?auto=format&fit=crop&q=80&w=800'),
('13','en','Thyroid Cancer','Thyroid cancer occurs in the cells of the thyroid — a butterfly-shaped gland located at the base of your neck.','• A lump (nodule) that can be felt through the skin on your neck\n• Changes to your voice, including increasing hoarseness\n• Difficulty swallowing\n• Pain in your neck and throat\n• Swollen lymph nodes in your neck','Surgery, thyroid hormone therapy, radioactive iodine, targeted drug therapy.','https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&q=80&w=800'),
('14','en','Kidney Cancer','Kidney cancer is cancer that begins in the kidneys.','• Blood in your urine, which may appear pink, red or cola colored\n• Pain in your back or side that doesn''t go away\n• Loss of appetite\n• Unexplained weight loss\n• Tiredness\n• Fever','Surgery, cryoablation, radiofrequency ablation, immunotherapy, targeted therapy.','https://images.unsplash.com/photo-1559757175-5700dde675bc?auto=format&fit=crop&q=80&w=800'),
('15','en','Bladder Cancer','Bladder cancer begins in the cells of the bladder.','• Blood in urine (hematuria)\n• Frequent urination\n• Painful urination\n• Back pain','Surgery, intravesical therapy, chemotherapy, radiation therapy, immunotherapy.','https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?auto=format&fit=crop&q=80&w=800')
ON CONFLICT (id, lang) DO NOTHING;

-- =====================
-- SEED: Hospitals (EN)
-- =====================
INSERT INTO hospitals (id, lang, name, address, phone, description, image_url, rating, specialties) VALUES
('1','en','Yangon General Hospital','Bogyoke Aung San Road, Latha Township, Yangon','+95 1 256 112','Yangon General Hospital is the largest hospital in Myanmar. It has a dedicated oncology department offering comprehensive cancer care including public services.','https://images.unsplash.com/photo-1538108149393-fbbd81895907?auto=format&fit=crop&q=80&w=800',4.5,ARRAY['Oncology','Surgery','General Medicine','Radiology','Emergency Medicine']),
('2','en','Pinlon Hospital','No. 26/Ka, Pinlon Road, North Dagon Township, Yangon','+95 1 581 329','Pinlon Hospital is a private hospital known for its specialized cancer center. It provides advanced diagnostic and treatment services including PET CT, Radiation Oncology, and Medical Oncology.','https://images.unsplash.com/photo-1586773860418-d37222d8fce3?auto=format&fit=crop&q=80&w=800',4.8,ARRAY['Cancer Center','Cardiology','Neurology','Urology','Nuclear Medicine']),
('3','en','Asia Royal Hospital','No. 14, Baho Road, Sanchaung Township, Yangon','+95 1 538 055','Asia Royal Hospital provides multi-disciplinary medical services with modern facilities and experienced specialists.','https://images.unsplash.com/photo-1596541223130-5d31a73fb6c6?auto=format&fit=crop&q=80&w=800',4.6,ARRAY['Internal Medicine','Surgery','Pediatrics','Obstetrics & Gynecology','Oncology']),
('4','en','Pun Hlaing Siloam Hospital','Pun Hlaing Golf Estate Avenue, Hlaing Tharyar Township, Yangon','+95 1 368 4323','Pun Hlaing Siloam Hospital is the only hospital in Myanmar to be accredited by the Joint Commission International (JCI).','https://images.unsplash.com/photo-1586773860418-d37222d8fce3?auto=format&fit=crop&q=80&w=800',4.9,ARRAY['Emergency Care','Cardiology','Orthopedics','Wellness Checkup','Oncology']),
('5','en','Grand Hantha International Hospital','No. 3, Corner of Nar Nat Taw Road & Kyye Myindaing Kanner Road, Kamаryut Township, Yangon','+95 1 523 000','Grand Hantha International Hospital is a private hospital in Yangon providing a wide range of medical services with advanced equipment.','https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=800',4.7,ARRAY['Cardiology','Neurology','Gastroenterology','Oncology','Pediatrics'])
ON CONFLICT (id, lang) DO NOTHING;

-- =====================
-- SEED: Blogs (EN)
-- =====================
INSERT INTO blogs (id, lang, title, author, content, image_url, date, category) VALUES
('1','en','Understanding Cancer Types','Dr. Thida Win','Cancer is a complex group of diseases with many possible causes. In this section, you can learn more about the different types of cancer, including risk factors, symptoms, diagnostic tests, and treatment options. Early detection is key to successful treatment.','https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '2 days','Education'),
('2','en','Healthy Diet for Prevention','Nutritionist Ma Khin','Eating a variety of foods usually ensures you get the nutrients you need. Focus on fruits, vegetables, and whole grains. Limit processed meats and red meat. Drink alcohol in moderation, if at all. A balanced diet strengthens the immune system.','https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '5 days','Lifestyle'),
('3','en','New Treatments in 2026','Medical News Team','Researchers are constantly working to find better ways to prevent, diagnose, and treat cancer. The latest advancements include new immunotherapy drugs and personalized medicine approaches that target specific genetic mutations in cancer cells.','https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '10 days','Research'),
('4','en','Coping with Diagnosis','Dr. Myo Min','A cancer diagnosis can be overwhelming. It helps to learn as much as you can about your cancer diagnosis so you can make decisions about your care. Talk with your doctor, family, and friends. Support groups can also provide immense emotional relief.','https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '15 days','Support'),
('5','en','Mental Wellness for Patients','Psychologist Dr. Kyaw','Maintaining mental health is crucial during cancer treatment. Stress management techniques such as meditation, yoga, and mindfulness can help reduce anxiety and improve quality of life during recovery.','https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '20 days','Mental Health'),
('6','en','Guide for Caregivers','Nurse Su Su','Being a caregiver for a cancer patient is a challenging yet rewarding role. It''s important to take care of yourself too. This guide offers practical tips on managing medications, doctor visits, and emotional support.','https://images.unsplash.com/photo-1576765608535-5f04d1e3f289?auto=format&fit=crop&q=80&w=800',NOW() - INTERVAL '25 days','Caregiving')
ON CONFLICT (id, lang) DO NOTHING;

-- =====================
-- SEED: Treatments (EN)
-- =====================
INSERT INTO treatments (id, lang, name, description, procedure_steps, side_effects, recovery, image_url, applicable_cancers) VALUES
('1','en','Surgery','Surgery is often the first line of treatment for many types of cancer. It involves physically removing the tumor and surrounding tissue from the body.','The surgical procedure varies depending on the type and location of cancer. It may involve:\n• Removing the tumor and a margin of healthy tissue\n• Removing nearby lymph nodes\n• Reconstructive surgery if needed\n• Minimally invasive techniques when possible','• Pain and discomfort at the surgical site\n• Risk of infection\n• Bleeding\n• Fatigue during recovery\n• Scarring\n• Potential complications specific to the surgery type','Recovery time varies from a few weeks to several months depending on the extent of surgery. Follow-up care includes wound care, pain management, and gradual return to normal activities.','https://images.unsplash.com/photo-1551190822-a9333d879b1f?auto=format&fit=crop&q=80&w=800',ARRAY['Breast Cancer','Lung Cancer','Colorectal Cancer','Skin Cancer','Ovarian Cancer','Thyroid Cancer']),
('2','en','Chemotherapy','Chemotherapy uses powerful drugs to kill cancer cells or stop them from growing and dividing. It can be used alone or in combination with other treatments.','Chemotherapy is typically administered:\n• Intravenously (IV) through a vein\n• Orally as pills or capsules\n• Through injections\n• Topically as creams\n• Treatment cycles with rest periods in between','• Hair loss\n• Nausea and vomiting\n• Fatigue\n• Increased risk of infection\n• Loss of appetite\n• Mouth sores\n• Changes in taste\n• Anemia','Side effects usually improve after treatment ends. Hair typically grows back within 3-6 months. Regular blood tests monitor recovery of blood cell counts.','https://images.unsplash.com/photo-1579154204601-01588f351e67?auto=format&fit=crop&q=80&w=800',ARRAY['Leukemia','Lymphoma','Breast Cancer','Lung Cancer','Ovarian Cancer','Bladder Cancer']),
('3','en','Radiation Therapy','Radiation therapy uses high-energy rays or particles to destroy cancer cells. It can be delivered externally or internally (brachytherapy).','Treatment process includes:\n• Planning CT scans to map treatment area\n• Daily sessions (usually 5 days/week)\n• Each session lasts 10-30 minutes\n• Painless procedure\n• Treatment course typically 1-7 weeks','• Skin changes (redness, dryness)\n• Fatigue\n• Hair loss in treated area\n• Nausea (if abdomen treated)\n• Difficulty swallowing (if throat treated)\n• Side effects specific to treatment area','Most side effects improve within weeks after treatment ends. Skin changes may take several months to fully heal. Long-term follow-up monitors for late effects.','https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&q=80&w=800',ARRAY['Breast Cancer','Lung Cancer','Prostate Cancer','Brain Tumors','Cervical Cancer']),
('4','en','Immunotherapy','Immunotherapy helps your immune system fight cancer. It uses substances made by the body or in a laboratory to boost or restore immune system function.','Immunotherapy can be given:\n• Intravenously (IV)\n• Orally as pills\n• Topically as creams\n• Directly into the bladder\n• Treatment schedules vary by type','• Flu-like symptoms (fever, chills)\n• Fatigue\n• Skin reactions at injection site\n• Diarrhea\n• Weight changes\n• Autoimmune reactions\n• Inflammation of organs','Response to immunotherapy can continue after treatment ends. Side effects may persist but are generally manageable. Regular monitoring is essential.','https://images.unsplash.com/photo-1582719471137-c3967ffb1c42?auto=format&fit=crop&q=80&w=800',ARRAY['Melanoma','Lung Cancer','Kidney Cancer','Bladder Cancer','Lymphoma']),
('5','en','Targeted Therapy','Targeted therapy uses drugs that target specific genes or proteins that help cancer cells grow and survive.','Administration methods:\n• Oral medications (pills or capsules)\n• Intravenous infusions\n• Subcutaneous injections\n• Treatment may be continuous or in cycles\n• Often combined with other treatments','• Diarrhea\n• Liver problems\n• Skin and nail changes\n• High blood pressure\n• Blood clotting problems\n• Slow wound healing\n• Fatigue','Side effects are usually less severe than chemotherapy. Most improve after treatment stops. Regular blood tests monitor liver function and other parameters.','https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&q=80&w=800',ARRAY['Breast Cancer','Lung Cancer','Colorectal Cancer','Leukemia','Melanoma','Kidney Cancer','Thyroid Cancer']),
('6','en','Hormone Therapy','Hormone therapy slows or stops the growth of cancers that use hormones to grow. It works by blocking the body''s ability to produce hormones or interfering with hormone action.','Treatment approaches:\n• Oral medications (daily pills)\n• Injections (monthly or every few months)\n• Surgery to remove hormone-producing organs\n• Treatment duration: typically 5-10 years\n• May be combined with other treatments','• Hot flashes\n• Fatigue\n• Mood changes\n• Bone thinning (osteoporosis)\n• Weight gain\n• Joint pain\n• Sexual side effects','Many side effects improve after treatment ends. Bone density monitoring is important during and after treatment. Long-term benefits often outweigh temporary side effects.','https://images.unsplash.com/photo-1587854692152-cbe660dbde88?auto=format&fit=crop&q=80&w=800',ARRAY['Breast Cancer','Prostate Cancer','Ovarian Cancer','Endometrial Cancer','Thyroid Cancer'])
ON CONFLICT (id, lang) DO NOTHING;
