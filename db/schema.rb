# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "AT010", primary_key: "CDBUMON", id: :string, limit: 5, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXBUMON", limit: 30, null: false
    t.string "NRKANRISYA", limit: 5, null: false
    t.string "TXTEKIYO", limit: 300
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "AT011", primary_key: ["CDBUMON", "DTHAKKOUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDBUMON", limit: 5, null: false
    t.string "DTHAKKOUNENGETSU", limit: 6, null: false
    t.string "CDJYOUIBUMON", limit: 5, null: false
    t.string "DTSIKKOUNENGETSU", limit: 6, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDBUMON"], name: "IndexAT011WithCDBUMON"
    t.index ["CDJYOUIBUMON"], name: "IndexAT011WithCDJYOUIBUMON"
  end

  create_table "AT020", primary_key: "NRJYUGYOIN", id: :string, limit: 5, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKANA", limit: 20, null: false
    t.string "TXKANJI", limit: 20, null: false
    t.string "KBKOYOU", limit: 5, null: false
    t.date "DTNYUSYA", null: false
    t.date "DTTAISYA"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "AT021", primary_key: ["NRJYUGYOIN", "DTSYOZOKUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUGYOIN", limit: 5, null: false
    t.string "DTSYOZOKUNENGETSU", limit: 6, null: false
    t.string "CDBUMON", limit: 5, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDBUMON"], name: "IndexAT021WithCDBUMON"
    t.index ["NRJYUGYOIN"], name: "IndexAT021WithNRJYUGYOIN"
  end

  create_table "AT030", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKANA", limit: 40, null: false
    t.string "TXKANJI", limit: 40, null: false
    t.string "KBCOUNTRY", limit: 3, null: false
    t.string "KBCURRENCY", limit: 3, null: false
    t.string "NRYUBIN", limit: 8, null: false
    t.string "TXJYUSYO1", limit: 30, null: false
    t.string "TXJYUSYO2", limit: 30
    t.string "NRDENWA", limit: 14, null: false
    t.string "NRFAX", limit: 14, null: false
    t.string "TXURL", limit: 40
    t.integer "UPDCOUNTER", default: 0
    t.index ["TXKANJI"], name: "AT030_SK1", unique: true
  end

  create_table "BT010", primary_key: "CDMAKER", id: :string, limit: 5, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXMAKER", limit: 40, null: false
    t.string "TXMAKERABR", limit: 10, null: false
    t.string "KBCOUNTRY", limit: 3, null: false
    t.string "NRYUBIN", limit: 8, null: false
    t.string "TXJYUSYO", limit: 40, null: false
    t.string "NRDENWA", limit: 14, null: false
    t.string "NRFAX", limit: 14, null: false
    t.string "TXURL", limit: 40
    t.string "TXEMAIL", limit: 40
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "BT020", primary_key: "NRSYOHIN", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSYOHIN", limit: 30, null: false
    t.string "TXHINBAN", limit: 20, null: false
    t.string "TXSIYOU", limit: 50
    t.string "TXIMAGEFILENAME", limit: 30
    t.string "KBSYOHIN", limit: 5, null: false
    t.string "CDMAKER", limit: 5, null: false
    t.integer "PRHANBAI", default: 0
    t.integer "PRSIIRE", default: 0
    t.string "KBZAIKOUM", limit: 5, null: false
    t.integer "QTHANBAIUNIT", default: 0, null: false
    t.integer "QTANZENZAIKO", default: 0
    t.integer "QTJYOUGENZAIKO", default: 0, null: false
    t.string "FGLOTKANRI", limit: 1, null: false
    t.string "FGLISTSYOHIN", limit: 1, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDMAKER"], name: "IndexBT020WithCDMAKER"
    t.index ["TXHINBAN"], name: "BT020_SK1", unique: true
  end

  create_table "BT021", primary_key: ["NRSYOHIN", "NRCHILD"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRCHILD", limit: 7, null: false
    t.integer "RTKOUSEI", default: 0, null: false
    t.string "FGNOUHIN", limit: 1, null: false
    t.integer "SQLIST", limit: 2, default: 0
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN", "SQLIST"], name: "IndexBT021WithNRSYOHIN_SQLIST"
  end

  create_table "BT030", primary_key: "NRSOUKO", id: :string, limit: 5, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSOUKO", limit: 20, null: false
    t.string "TXSOUKOENG", limit: 30
    t.string "NRYUBIN", limit: 8, null: false
    t.string "TXJYUSYO", limit: 40, null: false
    t.string "TXJYUSYOENG", limit: 40
    t.string "NRDENWA", limit: 14, null: false
    t.string "NRFAX", limit: 14, null: false
    t.string "NRDEFAULTLOCATION", limit: 5
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "BT031", primary_key: ["NRSOUKO", "NRLOCATION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5, null: false
    t.string "TXTEKIYO", limit: 20
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSOUKO"], name: "IndexBT031WithNRSOUKO"
  end

  create_table "CT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXTANTOUBUSYO", limit: 30, null: false
    t.string "TXTANTOUSYA", limit: 40
    t.string "TXTANTOUSYASYOKUI", limit: 10
    t.string "TXTANTOUSYAEMAIL", limit: 40
    t.string "TXTANTOUSYADENWA", limit: 20
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false
    t.string "TXHURIKOMISAKI", limit: 50
    t.integer "VLNYUKINSAITO", limit: 2, default: 0, null: false
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false
    t.string "TXTEKIYO", limit: 300
    t.decimal "AMKISYUKAIKAKE", precision: 11, scale: 2, default: "0.0"
    t.decimal "AMKEIJYOU", precision: 11, scale: 2, default: "0.0"
    t.decimal "AMSIHARAI", precision: 11, scale: 2, default: "0.0"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "CT011", primary_key: ["NRSYOHIN", "NRTORIHIKISAKI", "DTHAKKOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.date "DTHAKKOU", null: false
    t.date "DTSIKKOU", null: false
    t.string "KBSIIREUM", limit: 5, null: false
    t.integer "QTSIIRETANNI", default: 0, null: false
    t.integer "VLKANZANKEISU", default: 0, null: false
    t.decimal "PRSIIRETANKA", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "VLLEADTIME", limit: 2, default: 0
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN"], name: "IndexCT011WithNRSYOHIN"
    t.index ["NRTORIHIKISAKI"], name: "IndexCT011WithNRTORIHIKISAKI"
  end

  create_table "CT100", primary_key: "NRSIIRE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false
    t.string "FGVALID", limit: 1, null: false
    t.string "KBSIIRE", limit: 2, null: false
    t.date "DTSIIRE", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "NRSYOHIN", limit: 7
    t.string "TXSYOHIN", limit: 30
    t.decimal "PRSIIRE", precision: 10, scale: 2, default: "0.0"
    t.string "KBCURRENCY", limit: 3, null: false
    t.integer "QTSIIRE", default: 0
    t.string "KBSIIREUM", limit: 5, null: false
    t.decimal "AMSIIRE", precision: 11, scale: 2, default: "0.0", null: false
    t.integer "AMTAX", default: 0
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.string "NRSIHARAIIRAI", limit: 7
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexCT100WithDTCREATE"
    t.index ["NRSIHARAIIRAI"], name: "IndexCT100WithNRSIHARAIIRAI"
    t.index ["NRTORIHIKIKANRI", "NRSIIRE"], name: "IndexCT100WithNRTORIHIKIKANRI_NRSIIRE"
    t.index ["NRTORIHIKISAKI"], name: "IndexCT100WithNRTORIHIKISAKI"
  end

  create_table "CT110", primary_key: "NRSIHARAIIRAI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSIHARAIIRAI", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "TXSEIKYUNO", limit: 20
    t.string "TXTEKIYO", limit: 300
    t.string "FGSYOUNIN", limit: 1, null: false
    t.string "NRSIHARAI", limit: 7
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSIHARAI"], name: "IndexCT110WithNRSIHARAI"
    t.index ["NRTORIHIKIKANRI"], name: "CT110_SK1", unique: true
  end

  create_table "CT120", primary_key: "NRSIHARAI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSIHARAI", null: false
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false
    t.string "KBCURRENCY", limit: 3, null: false
    t.integer "AMNAIKASIHARAI", default: 0
    t.integer "AMTESURYO", default: 0
    t.string "TXTEKIYO", limit: 300
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDKAKERITSURANK", limit: 2, null: false
    t.string "TXTANTOUBUSYO", limit: 30, null: false
    t.string "TXTANTOUSYA", limit: 40
    t.string "TXTANTOUSYASYOKUI", limit: 10
    t.string "TXTANTOUSYAEMAIL", limit: 40
    t.string "TXTANTOUSYADENWA", limit: 20
    t.string "KBSEIKYUHOUSHIKI", limit: 2, null: false
    t.string "TXSIMEBI", limit: 10
    t.string "CDNOUHINSYOYOSHIKI", limit: 4
    t.string "KBNYUKINHOUHOU", limit: 2, null: false
    t.integer "VLNYUKINSAITO", limit: 2, default: 0, null: false
    t.integer "AMYOSHIN", default: 0, null: false
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false
    t.string "TXTEKIYO", limit: 300
    t.integer "AMKISYUURIKAKE", default: 0
    t.integer "AMKEIJYOU", default: 0
    t.integer "AMKAISYU", default: 0
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTANTOUJYUGYOIN"], name: "IndexDT010WithNRTANTOUJYUGYOIN"
  end

  create_table "DT011", primary_key: ["NRTORIHIKISAKI", "SQSYUKKASAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false
    t.string "TXKANJI", limit: 40, null: false
    t.string "NRYUBIN", limit: 8, null: false
    t.string "TXJYUSYO", limit: 40, null: false
    t.string "NRDENWA", limit: 14, null: false
    t.string "NRFAX", limit: 14
    t.integer "VLUNSOULT", limit: 2, default: 0, null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT020", primary_key: "CDKAKERITSURANK", id: :string, limit: 2, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKAKERITSURANK", limit: 20, null: false
    t.decimal "VLKAKERITSU", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT100", primary_key: "NRURIAGE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false
    t.string "FGVALID", limit: 1, null: false
    t.string "KBURIAGE", limit: 2, null: false
    t.date "DTURIAGE", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "NRSYOHIN", limit: 7
    t.string "TXSYOHIN", limit: 30
    t.integer "PRHANBAI", default: 0
    t.integer "PRURIAGE", default: 0
    t.integer "QTURIAGE", default: 0
    t.string "KBURIAGEUM", limit: 5, null: false
    t.integer "AMURIAGE", default: 0
    t.integer "AMTAX", default: 0
    t.integer "AMGENKA", default: 0
    t.string "NRSEIKYU", limit: 7
    t.string "NRJYUGYOIN", limit: 5
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexDT100WithDTCREATE"
    t.index ["NRTORIHIKIKANRI", "NRURIAGE"], name: "IndexDT100WithNRTORIHIKIKANRI_NRURIAGE"
    t.index ["NRTORIHIKISAKI"], name: "IndexDT100WithNRTORIHIKISAKI"
  end

  create_table "DT110", primary_key: "NRSEIKYU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSEIKYU", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "TXTEKIYO", limit: 300
    t.date "DTHAKKOU"
    t.date "DTNYUKIN"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT120", primary_key: "NRJYURYOU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.date "DTJYURYOU", null: false
    t.string "KBNYUKINHOUHOU", limit: 2, null: false
    t.integer "AMJYURYOU", default: 0, null: false
    t.integer "AMTESURYOU", default: 0
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "DT120_SK1", unique: true
  end

  create_table "ET010", primary_key: ["NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5
    t.integer "QTANZENZAIKO", default: 0
    t.integer "QTJYOUGENZAIKO", default: 0
    t.integer "QTKISYUZAIKO", default: 0
    t.integer "QTNYUKO", default: 0
    t.integer "QTSYUKKO", default: 0
    t.integer "AMKISYUZAIKO", default: 0
    t.integer "AMNYUKO", default: 0
    t.integer "AMSYUKKO", default: 0
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSOUKO"], name: "IndexET010WithNRSOUKO"
  end

  create_table "ET100", primary_key: "NRUKEBARAI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false
    t.string "FGVALID", limit: 1, null: false
    t.string "KBUKEBARAI", limit: 2, null: false
    t.date "DTUKEBARAI", null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5, null: false
    t.string "NRIDOUSOUKO", limit: 5
    t.string "NRTORIHIKISAKI", limit: 8
    t.integer "SQSYUKKASAKI", limit: 2, default: 0
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "TXLOTNUMBER", limit: 40, null: false
    t.integer "QTUKEBARAI", default: 0
    t.integer "AMUKEBARAI", default: 0
    t.integer "AMSAGAKU", default: 0
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexET100WithDTCREATE"
    t.index ["NRTORIHIKIKANRI", "NRUKEBARAI"], name: "IndexET100WithNRTORIHIKIKANRI_NRUKEBARAI"
  end

  create_table "ET200", primary_key: "NRTORIHIKIKANRI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBYOTEI", limit: 2, null: false
    t.date "DTYOTEI", null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRIDOUSOUKO", limit: 5
    t.string "NRTORIHIKISAKI", limit: 8
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "QTYOTEI", default: 0
    t.string "NRSANSYOU", limit: 15, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN", "NRSOUKO"], name: "IndexET200WithNRSYOHIN_NRSOUKO"
  end

  create_table "FT010", primary_key: "NRHATTYU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTHATTYU", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "NRJYUGYOIN", limit: 5, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "FGKAKUNIN", limit: 1, null: false
    t.string "TXTEKIYO", limit: 300
    t.date "DTKIBOUNOUKI"
    t.date "DTHAKKOU"
    t.date "DTTORIKESHI"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "FT011", primary_key: ["NRHATTYU", "SQHATTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false
    t.integer "SQHATTYU", limit: 2, default: 0, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.decimal "PRHATTYU", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "QTHATTYU", default: 0, null: false
    t.date "DTKIBOUNOUKI", null: false
    t.string "TXTEKIYO", limit: 300
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "FT012", primary_key: ["NRHATTYU", "SQHATTYU", "SQNYUKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false
    t.integer "SQHATTYU", limit: 2, default: 0, null: false
    t.integer "SQNYUKA", limit: 2, default: 0, null: false
    t.date "DTYOTEINYUKA", null: false
    t.string "FGKAKUNIN", limit: 1, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "QTYOTEISIIRE", default: 0, null: false
    t.integer "QTJITSUSIIRE", default: 0
    t.integer "QTDEFECT", default: 0
    t.decimal "PRSIIRE", precision: 10, scale: 2, default: "0.0", null: false
    t.string "TXLOTNUMBER", limit: 40
    t.string "NRLOCATION", limit: 5
    t.string "NRNYUKA", limit: 7
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "FT012_SK1", unique: true
  end

  create_table "FT020", primary_key: "NRNYUKA", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.date "DTNYUKA", null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT010", primary_key: "NRJYUTYU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTJYUTYU", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false
    t.string "TXTYUBAN", limit: 15
    t.string "NRSOUKO", limit: 5, null: false
    t.string "TXTEKIYO", limit: 300
    t.date "DTTORIKESHI"
    t.string "NRMITSUMORI", limit: 7
    t.integer "SQVERSION", limit: 2, default: 0
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRMITSUMORI", "SQVERSION"], name: "IndexGT010WithNRMITSUMORI_SQVERSION"
  end

  create_table "GT011", primary_key: ["NRJYUTYU", "SQJYUTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false
    t.integer "SQJYUTYU", limit: 2, default: 0, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "PRJYUTYU", default: 0, null: false
    t.integer "QTJYUTYU", default: 0, null: false
    t.date "DTKIBOUNOUKI", null: false
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKISAKI"], name: "IndexGT011WithNRTORIHIKISAKI"
  end

  create_table "GT012", primary_key: ["NRJYUTYU", "SQJYUTYU", "SQSYUKKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false
    t.integer "SQJYUTYU", limit: 2, default: 0, null: false
    t.integer "SQSYUKKA", limit: 2, default: 0, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.date "DTYOTEISYUKKA", null: false
    t.integer "QTYOTEISYUKKA", default: 0, null: false
    t.integer "QTJITSUSYUKKA", default: 0
    t.integer "QTTORIKESHI", default: 0
    t.integer "PRSYUKKO", default: 0
    t.string "TXLOTNUMBER", limit: 40
    t.string "NRSYUKKA", limit: 7
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYUKKA"], name: "IndexGT012WithNRSYUKKA"
    t.index ["NRTORIHIKIKANRI"], name: "GT012_SK1", unique: true
  end

  create_table "GT020", primary_key: "NRSYUKKA", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.date "DTSYUKKA", null: false
    t.string "TXTEKIYO", limit: 300
    t.string "NRSEIKYU", limit: 7
    t.datetime "TMHAKKOU"
    t.datetime "TMKANRYO"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT030", primary_key: ["NRMITSUMORI", "SQVERSION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false
    t.integer "SQVERSION", limit: 2, default: 0, null: false
    t.date "DTMITSUMORI", null: false
    t.string "NRTORIHIKISAKI", limit: 8
    t.integer "SQSYUKKASAKI", limit: 2, default: 0
    t.string "TXKOKYAKUMEI", limit: 40
    t.string "TXTYUBAN", limit: 15
    t.string "TXTEKIYO", limit: 300
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT031", primary_key: ["NRMITSUMORI", "SQVERSION", "SQMITSUMORI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false
    t.integer "SQVERSION", limit: 2, default: 0, null: false
    t.integer "SQMITSUMORI", limit: 2, default: 0, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "PRJYUTYU", default: 0, null: false
    t.integer "QTJYUTYU", default: 0, null: false
    t.date "DTKIBOUNOUKI", null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "HT010", primary_key: "NRSIIREHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBSIIREHURIKAE", limit: 2, null: false
    t.date "DTTORIHIKI", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.decimal "AMTORIHIKI", precision: 10, scale: 2, default: "0.0", null: false
    t.string "TXTEKIYO", limit: 30, null: false
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "HT010_SK1", unique: true
  end

  create_table "HT020", primary_key: "NRTOKUSYUSIIRE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUSIIRE", limit: 2, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.date "DTTORIHIKI", null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5, null: false
    t.string "TXLOTNUMBER", limit: 40
    t.decimal "PRTORIHIKI", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "QTTORIHIKI", default: 0, null: false
    t.string "KBTORIHIKIUM", limit: 5, null: false
    t.integer "PRUKEBARAI", default: 0
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "HT020_SK1", unique: true
  end

  create_table "JT010", primary_key: "NRURIAGEHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBURIAGEHURIKAE", limit: 2, null: false
    t.date "DTTORIHIKI", null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "AMTORIHIKI", default: 0, null: false
    t.string "TXTEKIYO", limit: 30, null: false
    t.string "NRSEIKYU", limit: 7
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "JT010_SK1", unique: true
  end

  create_table "JT020", primary_key: "NRTOKUSYUURIAGE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUURIAGE", limit: 2, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false
    t.date "DTTORIHIKI", null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "TXLOTNUMBER", limit: 40
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5, null: false
    t.integer "PRTORIHIKI", default: 0, null: false
    t.integer "QTTORIHIKI", default: 0, null: false
    t.integer "PRUKEBARAI", default: 0
    t.string "TXTEKIYO", limit: 300
    t.string "NRSEIKYU", limit: 7
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "JT020_SK1", unique: true
  end

  create_table "KT010", primary_key: "NRTANAOROSHI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5
    t.datetime "DTKIJYUN"
    t.datetime "DTKOUSHIN"
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT010_SK1", unique: true
  end

  create_table "KT011", primary_key: ["NRTANAOROSHI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTANAOROSHI", limit: 7, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRLOCATION", limit: 5, null: false
    t.integer "PRUKEBARAI", default: 0, null: false
    t.integer "QTTYOUBO", default: 0
    t.integer "QTJITSUTANA", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "KT020", primary_key: "NRZAIKOIDOU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSHIJI", null: false
    t.string "NRSOUKOFROM", limit: 5, null: false
    t.string "NRSOUKOTO", limit: 5, null: false
    t.date "DTKANRYOYOTEI", null: false
    t.datetime "TMHAKKOU"
    t.datetime "TMKANRYO"
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT020_SK1", unique: true
  end

  create_table "KT021", primary_key: ["NRZAIKOIDOU", "SQZAIKOIDOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRZAIKOIDOU", limit: 7, null: false
    t.integer "SQZAIKOIDOU", limit: 2, default: 0, null: false
    t.string "NRLOCATIONTO", limit: 5
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "TXLOTNUMBER", limit: 40
    t.integer "QTIDOU", default: 0, null: false
    t.integer "PRIDOU", default: 0
    t.string "NRTORIHIKIKANRIFROM", limit: 7, null: false
    t.string "NRTORIHIKIKANRITO", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRIFROM"], name: "KT021_SK1", unique: true
    t.index ["NRTORIHIKIKANRITO"], name: "KT021_SK2", unique: true
  end

  create_table "KT030", primary_key: "NRZAIKOHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBZAIKOHURIKAE", limit: 2, null: false
    t.date "DTHURIKAE", null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.string "NRLOCATION", limit: 5
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "TXLOTNUMBER", limit: 40
    t.integer "QTHURIKAE", default: 0
    t.integer "AMHURIKAE", default: 0
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT030_SK1", unique: true
  end

  create_table "LT010", primary_key: "NRSET", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false
    t.date "DTYOTEI", null: false
    t.datetime "TMHAKKOU"
    t.datetime "TMJISSEKI"
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "QTSHIJI", default: 0, null: false
    t.integer "QTJISSEKI", default: 0
    t.integer "AMJISSEKI", default: 0
    t.string "NRLOCATION", limit: 5
    t.string "TXLOTNUMBER", limit: 40
    t.string "TXTEKIYO", limit: 300
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "LT010_SK1", unique: true
  end

  create_table "LT011", primary_key: ["NRSET", "SQKOUSEI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSET", limit: 7, null: false
    t.integer "SQKOUSEI", limit: 2, default: 0, null: false
    t.string "NRCHILD", limit: 7, null: false
    t.integer "QTSHIJI", default: 0
    t.integer "QTJISSEKI", default: 0
    t.integer "PRTORIHIKI", default: 0
    t.string "NRLOCATION", limit: 5
    t.string "TXLOTNUMBER", limit: 40
    t.string "NRTORIHIKIKANRI", limit: 7, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "LT011_SK1", unique: true
  end

  create_table "YT010", primary_key: "DTNEND", id: :integer, limit: 2, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "AMURIKISYUZAN", default: 0
    t.bigint "AMURISYUK", default: 0
    t.bigint "AMURITYOK", default: 0
    t.bigint "AMURIHENPIN", default: 0
    t.bigint "AMURIZATSUEKI", default: 0
    t.bigint "AMURIZATSUSON", default: 0
    t.bigint "AMURISOUSAI", default: 0
    t.bigint "AMURINEBIKI", default: 0
    t.bigint "AMURIHANHURI", default: 0
    t.bigint "AMURIJYURYO", default: 0
    t.bigint "AMURIGENKA", default: 0
    t.bigint "AMURITAX", default: 0
    t.bigint "AMKAIKISYUZAN", default: 0
    t.bigint "AMKAINYUK", default: 0
    t.bigint "AMKAITYOK", default: 0
    t.bigint "AMKAIHENPIN", default: 0
    t.bigint "AMKAIZATSUEKI", default: 0
    t.bigint "AMKAIZATSUSON", default: 0
    t.bigint "AMKAISOUSAI", default: 0
    t.bigint "AMKAIGENKA", default: 0
    t.bigint "AMKAISIHARAI", default: 0
    t.bigint "AMKAITAX", default: 0
    t.bigint "AMZAIKISYUZAN", default: 0
    t.bigint "AMZAINYUK", default: 0
    t.bigint "AMZAINYUKHEN", default: 0
    t.bigint "AMZAISYUK", default: 0
    t.bigint "AMZAISYUKHEN", default: 0
    t.bigint "AMZAIIDOU", default: 0
    t.bigint "AMZAIGENMOU", default: 0
    t.bigint "AMZAIHYOKAZON", default: 0
    t.bigint "AMZAIHYOKAEKI", default: 0
    t.bigint "AMZAISIKAKARI", default: 0
    t.bigint "AMZAIZATSUSON", default: 0
    t.bigint "AMZAIZATSUEKI", default: 0
    t.bigint "AMZAIKANSEI", default: 0
    t.bigint "AMZAIKAKOUHI", default: 0
    t.bigint "AMZAIZOUGEN", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT020", primary_key: ["DTNEND", "DTMSEQ"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.integer "AMURIKISYUZAN", default: 0
    t.integer "AMURISYUK", default: 0
    t.integer "AMURITYOK", default: 0
    t.integer "AMURIHENPIN", default: 0
    t.integer "AMURIZATSUEKI", default: 0
    t.integer "AMURIZATSUSON", default: 0
    t.integer "AMURISOUSAI", default: 0
    t.integer "AMURINEBIKI", default: 0
    t.integer "AMURIHANHURI", default: 0
    t.integer "AMURIJYURYO", default: 0
    t.integer "AMURIGENKA", default: 0
    t.integer "AMURITAX", default: 0
    t.integer "AMKAIKISYUZAN", default: 0
    t.integer "AMKAINYUK", default: 0
    t.integer "AMKAITYOK", default: 0
    t.integer "AMKAIHENPIN", default: 0
    t.integer "AMKAIZATSUEKI", default: 0
    t.integer "AMKAIZATSUSON", default: 0
    t.integer "AMKAISOUSAI", default: 0
    t.integer "AMKAIGENKA", default: 0
    t.integer "AMKAISIHARAI", default: 0
    t.integer "AMKAITAX", default: 0
    t.integer "AMZAIKISYUZAN", default: 0
    t.integer "AMZAINYUK", default: 0
    t.integer "AMZAINYUKHEN", default: 0
    t.integer "AMZAISYUK", default: 0
    t.integer "AMZAISYUKHEN", default: 0
    t.integer "AMZAIIDOU", default: 0
    t.integer "AMZAIGENMOU", default: 0
    t.integer "AMZAIHYOKAZON", default: 0
    t.integer "AMZAIHYOKAEKI", default: 0
    t.integer "AMZAISIKAKARI", default: 0
    t.integer "AMZAIZATSUSON", default: 0
    t.integer "AMZAIZATSUEKI", default: 0
    t.integer "AMZAIKANSEI", default: 0
    t.integer "AMZAIKAKOUHI", default: 0
    t.integer "AMZAIZOUGEN", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT030", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "AMZAIKISYUZAN", default: 0
    t.integer "QTZAIKISYUZAN", default: 0
    t.integer "AMZAINYUK", default: 0
    t.integer "QTZAINYUK", default: 0
    t.integer "AMZAINYUKHEN", default: 0
    t.integer "QTZAINYUKHEN", default: 0
    t.integer "AMZAISYUK", default: 0
    t.integer "QTZAISYUK", default: 0
    t.integer "AMZAISYUKHEN", default: 0
    t.integer "QTZAISYUKHEN", default: 0
    t.integer "AMZAIIDOU", default: 0
    t.integer "QTZAIIDOU", default: 0
    t.integer "AMZAIGENMOU", default: 0
    t.integer "QTZAIGENMOU", default: 0
    t.integer "AMZAIHYOKAZON", default: 0
    t.integer "AMZAIHYOKAEKI", default: 0
    t.integer "AMZAISIKAKARI", default: 0
    t.integer "QTZAISIKAKARI", default: 0
    t.integer "AMZAIZATSUSON", default: 0
    t.integer "QTZAIZATSUSON", default: 0
    t.integer "AMZAIZATSUEKI", default: 0
    t.integer "QTZAIZATSUEKI", default: 0
    t.integer "AMZAIKANSEI", default: 0
    t.integer "QTZAIKANSEI", default: 0
    t.integer "AMZAIKAKOUHI", default: 0
    t.integer "AMZAIZOUGEN", default: 0
    t.integer "QTZAIZOUGEN", default: 0
    t.integer "AMZAIARARI", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT031", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.string "NRSOUKO", limit: 5, null: false
    t.integer "AMZAIKISYUZAN", default: 0
    t.integer "QTZAIKISYUZAN", default: 0
    t.integer "AMZAINYUK", default: 0
    t.integer "QTZAINYUK", default: 0
    t.integer "AMZAINYUKHEN", default: 0
    t.integer "QTZAINYUKHEN", default: 0
    t.integer "AMZAISYUK", default: 0
    t.integer "QTZAISYUK", default: 0
    t.integer "AMZAISYUKHEN", default: 0
    t.integer "QTZAISYUKHEN", default: 0
    t.integer "AMZAIIDOU", default: 0
    t.integer "QTZAIIDOU", default: 0
    t.integer "AMZAIGENMOU", default: 0
    t.integer "QTZAIGENMOU", default: 0
    t.integer "AMZAIHYOKAZON", default: 0
    t.integer "AMZAIHYOKAEKI", default: 0
    t.integer "AMZAISIKAKARI", default: 0
    t.integer "QTZAISIKAKARI", default: 0
    t.integer "AMZAIZATSUSON", default: 0
    t.integer "QTZAIZATSUSON", default: 0
    t.integer "AMZAIZATSUEKI", default: 0
    t.integer "QTZAIZATSUEKI", default: 0
    t.integer "AMZAIKANSEI", default: 0
    t.integer "QTZAIKANSEI", default: 0
    t.integer "AMZAIKAKOUHI", default: 0
    t.integer "AMZAIZOUGEN", default: 0
    t.integer "QTZAIZOUGEN", default: 0
    t.integer "AMZAIARARI", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT040", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "AMKAIKISYUZAN", default: 0
    t.integer "AMKAINYUK", default: 0
    t.integer "AMKAITYOK", default: 0
    t.integer "AMKAIHENPIN", default: 0
    t.integer "AMKAIZATSUEKI", default: 0
    t.integer "AMKAIZATSUSON", default: 0
    t.integer "AMKAISOUSAI", default: 0
    t.integer "AMKAIGENKA", default: 0
    t.integer "AMKAISIHARAI", default: 0
    t.integer "AMKAITAX", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT041", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "AMKAINYUK", default: 0
    t.integer "QTKAINYUK", default: 0
    t.integer "AMKAITYOK", default: 0
    t.integer "QTKAITYOK", default: 0
    t.integer "AMKAIHENPIN", default: 0
    t.integer "QTKAIHENPIN", default: 0
    t.integer "AMKAIGENKA", default: 0
    t.integer "AMKAITAX", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT050", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.integer "AMURIKISYUZAN", default: 0
    t.integer "AMURISYUK", default: 0
    t.integer "AMURITYOK", default: 0
    t.integer "AMURIHENPIN", default: 0
    t.integer "AMURIZATSUEKI", default: 0
    t.integer "AMURIZATSUSON", default: 0
    t.integer "AMURISOUSAI", default: 0
    t.integer "AMURINEBIKI", default: 0
    t.integer "AMURIHANHURI", default: 0
    t.integer "AMURIJYURYO", default: 0
    t.integer "AMURIGENKA", default: 0
    t.integer "AMURITAX", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT051", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRTORIHIKISAKI", limit: 8, null: false
    t.string "NRSYOHIN", limit: 7, null: false
    t.integer "AMURISYUK", default: 0
    t.integer "QTURISYUK", default: 0
    t.integer "AMURITYOK", default: 0
    t.integer "QTURITYOK", default: 0
    t.integer "AMURIHENPIN", default: 0
    t.integer "QTURIHENPIN", default: 0
    t.integer "AMURINEBIKI", default: 0
    t.integer "AMURIHANHURI", default: 0
    t.integer "AMURIGENKA", default: 0
    t.integer "AMURITAX", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT060", primary_key: ["DTNEND", "DTMSEQ", "NRTANTOUJYUGYOIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false
    t.integer "AMURISYUK", default: 0
    t.integer "AMURITYOK", default: 0
    t.integer "AMURIHENPIN", default: 0
    t.integer "AMURIZATSUEKI", default: 0
    t.integer "AMURIZATSUSON", default: 0
    t.integer "AMURINEBIKI", default: 0
    t.integer "AMURIHANHURI", default: 0
    t.integer "AMURIGENKA", default: 0
    t.integer "AMURITAX", default: 0
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT010", primary_key: "IDVARIANT", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXNAME", limit: 10, null: false
    t.string "TXTYPE", limit: 10, null: false
    t.string "TXVALUE", limit: 100, null: false
    t.string "TXREMARKS", limit: 500
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT020", primary_key: "IDUSER", id: :string, limit: 5, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXNAME", limit: 30, null: false
    t.string "TXPASSWORD", limit: 50, null: false
    t.date "DTVALID", null: false
    t.date "DTEXPIRE", null: false
    t.string "TXEMAIL", limit: 40
    t.string "TXMENUS", limit: 30, null: false
    t.string "NREMPLOYEE", limit: 5
    t.integer "UPDCOUNTER", default: 0
    t.index ["NREMPLOYEE"], name: "IndexZT020WithNREMPLOYEE"
  end

  create_table "ZT021", primary_key: ["IDUSER", "IDFUNCTION", "IDFILTER"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "IDUSER", limit: 5, null: false
    t.string "IDFUNCTION", limit: 20, null: false
    t.string "IDFILTER", limit: 40, null: false
    t.string "TXVALUE", limit: 50
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT030", primary_key: "IDNUMBER", id: :string, limit: 20, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXPREFIX", limit: 4
    t.integer "NRNUMDIGIT", limit: 2, default: 0, null: false
    t.integer "NRCURRENT", default: 0, null: false
    t.string "FGWITHCD", limit: 1, null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT040", primary_key: ["IDUSERKUBUN", "KBUSERKUBUN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "IDUSERKUBUN", limit: 20, null: false
    t.string "KBUSERKUBUN", limit: 5, null: false
    t.string "TXUSERKUBUN", limit: 20, null: false
    t.string "SQLIST", limit: 2, null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT050", primary_key: "NRSESSION", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "DTLOGIN", null: false
    t.datetime "DTLOGOUT"
    t.string "IDUSER", limit: 5, null: false
    t.string "TXIPADDRESS", limit: 20, null: false
    t.string "VLVERSION", limit: 10, null: false
    t.string "KBSESSIONSTATUS", limit: 3, null: false
    t.integer "UPDCOUNTER", default: 0
    t.index ["IDUSER"], name: "IndexZT050WithIDUSER"
  end

  create_table "ZT051", primary_key: ["NRSESSION", "SQPROGRAM"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSESSION", limit: 7, null: false
    t.integer "SQPROGRAM", limit: 2, default: 0, null: false
    t.string "IDMENU", limit: 2, null: false
    t.string "IDPROGRAM", limit: 10, null: false
    t.string "TXPROGRAM", limit: 30, null: false
    t.datetime "DTSTART", null: false
    t.datetime "DTEND"
    t.string "KBPROGRAMSTATUS", limit: 2
    t.text "TXERRORLOG", limit: 4294967295
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT060", primary_key: "DTSTART", id: :date, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "VLTAXRATE", precision: 3, scale: 2, default: "0.0", null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT070", primary_key: ["KBCALENDAR", "DTOFF"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBCALENDAR", limit: 2, null: false
    t.date "DTOFF", null: false
    t.string "TXOFF", limit: 20
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT080", primary_key: ["KBCURRENCY", "DTNEND"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBCURRENCY", limit: 3, null: false
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.decimal "VLRATEB", precision: 10, scale: 3, default: "0.0", null: false
    t.decimal "VLRATEM", precision: 10, scale: 3, default: "0.0", null: false
    t.decimal "VLRATES", precision: 10, scale: 3, default: "0.0", null: false
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "ZT081", primary_key: ["KBCURRENCY", "DTNEND", "DTMSEQ"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBCURRENCY", limit: 3, null: false
    t.integer "DTNEND", limit: 2, default: 0, null: false
    t.integer "DTMSEQ", limit: 2, default: 0, null: false
    t.decimal "VLRATEB", precision: 10, scale: 3, default: "0.0", null: false
    t.decimal "VLRATEM", precision: 10, scale: 3, default: "0.0", null: false
    t.decimal "VLRATES", precision: 10, scale: 3, default: "0.0", null: false
    t.integer "UPDCOUNTER", default: 0
  end

end
