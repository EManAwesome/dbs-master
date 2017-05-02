select p2.*
from people p1,
     people p2,
     actors a,
     actorsinmovies am,
     movies m,
     directorsofmovies dm,
     directors d
where p1.pid = a.pid
  and a.pid = am.pid
  and am.mid = dm.mid
  and m.mid = dm.mid
  and d.pid = dm.pid
  and d.pid = p2.pid
  and p1.pid = 007;