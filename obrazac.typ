#import "@preview/tablex:0.0.9": tablex, cellx

#set page(
  header: {
    set text(size: 0.9em)
    set align(bottom)

    table(
      columns: (1fr, 1fr),
      stroke: none,
      inset: 2pt,
      [Fakultet informatike i digitalnih tehnologija, UNIRI],
      align(right)[Računalna animacija],
      [Sveučilišni prijediplomski studij Informatika],
      align(right)[2024./2025.]
    )
  },
  footer: align(right, context {
    counter(page).display()
  })
)

#text(size: 2em)[Dokumentacija 3D Animacije]

= Opće informacije

#table(
  columns: (auto, 1fr),
  [*Naziv animacije*],
  [Lijek],
  [*Trajanje animacije*],
  [32s],
  [*Korišteni alati*],
  [
    - MakeHuman
    - Blender
      - Plugin: IKEA, BlenderKit
  ],
  [*Sažetak animacije*],
  [
    Prilikom prikupljanja materijala Azriel se otruje paralitikom. Sutton kroz dug period uz potporu Jordana pronađe protuotrov. Zatim da protuotrov Azrielu koji uzrokuje nagao oporavak.
  ],
  [*Opis glabnih likova*],
  [
    - *Azriel:* Lik koji je otrovan i paraliziran veći dio animacije.
    - *Jordan:* Brižan lik koji je značajna podrška Suttonu prilikom izrade lijeka.
    - *Sutton:* Lik koji izrađuje lijek u Jordanovu pomoć.
  ]
)

#pagebreak()

= Scenarij animacije

== Ambijent

Radnja se odvija u budučnosti na drugom planetu. Ljudi na nekim planetima žive u nomadskim zajednicama zbog osiguravanja veće dostupnosti i dopuštanja ekosustavima da se oporave od uporabe. Federacija planeta je jako udaljena pa svaka zajednica treba sama prikupljati resurse za opstanak. Neki materijali i oprema jesu dostupni svim zajednicama, no svakodnevne potrebe ispunjavaju autonomno. Zbog velikog izobilja prirodnih dobara je tipično da ljudi dijele materijalna dobra.

Tempo života je _prirodniji_ i sporiji u usporedbi s hiperurbanim okruženjima.

#[
#show heading: it => align(center, upper(it))

== Scena 1

Kamera se približava šatoru.

Prikaz Suttona kako gleda kroz mikroskop. Zatim se zagleda u daljinu.

== Scena 2

Retrospektiva u prošlost gdje se Sutton prisjeća kako je 

]

#pagebreak()

#[
#set page(
  paper: "a4",
  flipped: true,
  margin: (
    top: 2cm,
    bottom: 1cm,
    left: 1cm,
    right: 1cm,
  )
)

= Gruba skica animacije

#let scene-counter = counter("scene")
#scene-counter.step()
#let frame-sum = counter("frame-sum")
#let fps = 30

#let sketch-entry(
  skica,
  br-okvira: 0,
  opis: [],
  vrsta-kadra: [Srednji kadar],
  dijalog: none,
  zvuk: none,
) = block(breakable: false, context {
  tablex(
    columns: (80pt, 1fr),
    rows: auto,
    [*RBR scene:*], {
      scene-counter.step()
      scene-counter.display()
    },
    [*RBR ključnog kadra:*], {
      frame-sum.display()
      frame-sum.update(it => it + br-okvira)
    },
    cellx(colspan: 2, inset: 0pt, align(center+horizon, image(
      width: 100%, skica
    ))),
    [*Opis:*], opis,
    [*Vrsta kadra:*], vrsta-kadra,
    [*Trajanje:*], [#(br-okvira / fps)s],
    ..if dijalog != none {
      ([*Dijalog:*], dijalog,)
    } else {()},
    ..if zvuk != none {
      ([*Zvuk:*], zvuk,)
    } else {()},
  )
})

#set align(center+horizon)

#table(
  columns: (1fr, 1fr, 1fr),
  align: center+horizon,
  stroke: none,

sketch-entry(
  "sketch/microscoping.png",
  opis: "Sutton proučava uzorak kroz mikroskop.",
  vrsta-kadra: "Srednji kadar (iz ekstremno širokog)",
  br-okvira: 120,
),
sketch-entry(
  "sketch/azriel_posion.png",
  opis: "Retrospekcija - prisjećanje na situaciju gdje je Azriel otrovan.",
  vrsta-kadra: "Srednji kadar",
  br-okvira: 180,
),
sketch-entry(
  "sketch/mixing.png",
  opis: "Jordan pomaže Suttonu pri otkrivanju lijeka.",
  dijalog: "Jordan čita uputstva za dio procesa dok ih Sutton provodi i potvrđuje.",
  br-okvira: 6 * 30
),
sketch-entry(
  "sketch/potion.png",
  opis: "Prikaz konačnog lijeka.",
  br-okvira: 60,
),
sketch-entry(
  "sketch/azriel_cure.png",
  opis: "Sutton daje lijek Azrielu.",
  br-okvira: 300,
),
sketch-entry(
  "sketch/hug.png",
  opis: "Zagrljaj.",
  br-okvira: 4 * 30,
)
)

]

#pagebreak()

= Animatik

Animatik se nalazi na poveznici:

#link("https://github.com/Caellian/RA_FIN/blob/trunk/animatik_v2.mkv")[
  https://github.com/Caellian/RA_FIN/blob/trunk/animatik_v2.mkv
]
