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

  create_table "AT010", primary_key: "CDBUMON", id: :string, limit: 5, comment: "部門C", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXBUMON", limit: 30, null: false, comment: "部門名"
    t.string "NRKANRISYA", limit: 5, null: false, comment: "管理者№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "AT011", primary_key: ["CDBUMON", "DTHAKKOUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDBUMON", limit: 5, null: false, comment: "部門C"
    t.string "DTHAKKOUNENGETSU", limit: 6, null: false, comment: "発効年月"
    t.string "CDJYOUIBUMON", limit: 5, null: false, comment: "上位部門C"
    t.string "DTSIKKOUNENGETSU", limit: 6, null: false, comment: "失効年月"
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDBUMON"], name: "IndexAT011WithCDBUMON"
    t.index ["CDJYOUIBUMON"], name: "IndexAT011WithCDJYOUIBUMON"
  end

  create_table "AT020", primary_key: "NRJYUGYOIN", id: :string, limit: 5, comment: "従業員№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKANA", limit: 20, null: false, comment: "カナ名"
    t.string "TXKANJI", limit: 20, null: false, comment: "漢字名"
    t.string "KBKOYOU", limit: 5, null: false, comment: "雇用区分"
    t.date "DTNYUSYA", null: false, comment: "入社日"
    t.date "DTTAISYA", comment: "退社日"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "AT021", primary_key: ["NRJYUGYOIN", "DTSYOZOKUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUGYOIN", limit: 5, null: false, comment: "従業員№"
    t.string "DTSYOZOKUNENGETSU", limit: 6, null: false, comment: "所属発効年月"
    t.string "CDBUMON", limit: 5, null: false, comment: "部門C"
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDBUMON"], name: "IndexAT021WithCDBUMON"
    t.index ["NRJYUGYOIN"], name: "IndexAT021WithNRJYUGYOIN"
  end

  create_table "AT030", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "仕入先№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKANA", limit: 40, null: false, comment: "カナ名"
    t.string "TXKANJI", limit: 40, null: false, comment: "漢字名"
    t.string "KBCOUNTRY", limit: 3, null: false, comment: "国コード"
    t.string "KBCURRENCY", limit: 3, null: false, comment: "取引通貨"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO1", limit: 30, null: false, comment: "住所１"
    t.string "TXJYUSYO2", limit: 30, comment: "住所２"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, null: false, comment: "FAX番号"
    t.string "TXURL", limit: 40, comment: "ＵＲＬ"
    t.integer "UPDCOUNTER", default: 0
    t.index ["TXKANJI"], name: "AT030_SK1", unique: true
  end

  create_table "BT010", primary_key: "CDMAKER", id: :string, limit: 5, comment: "メーカーＣ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXMAKER", limit: 40, null: false, comment: "メーカー名"
    t.string "TXMAKERABR", limit: 10, null: false, comment: "メーカー略称"
    t.string "KBCOUNTRY", limit: 3, null: false, comment: "国コード"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, null: false, comment: "FAX番号"
    t.string "TXURL", limit: 40, comment: "ＵＲＬ"
    t.string "TXEMAIL", limit: 40, comment: "担当者メアド"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "BT020", primary_key: "NRSYOHIN", id: :string, limit: 7, comment: "内部商品№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSYOHIN", limit: 30, null: false, comment: "商品名"
    t.string "TXHINBAN", limit: 20, null: false, comment: "品番"
    t.string "TXSIYOU", limit: 50, comment: "仕様"
    t.string "TXIMAGEFILENAME", limit: 30, comment: "外観"
    t.string "KBSYOHIN", limit: 5, null: false, comment: "商品群区分"
    t.string "CDMAKER", limit: 5, null: false, comment: "メーカーＣ"
    t.integer "PRHANBAI", default: 0, comment: "標準売価"
    t.integer "PRSIIRE", default: 0, comment: "標準仕入価格"
    t.string "KBZAIKOUM", limit: 5, null: false, comment: "在庫単位区分"
    t.integer "QTHANBAIUNIT", default: 0, null: false, comment: "販売単位数"
    t.integer "QTANZENZAIKO", default: 0, comment: "安全在庫省略値"
    t.integer "QTJYOUGENZAIKO", default: 0, null: false, comment: "上限在庫省略値"
    t.string "FGLOTKANRI", limit: 1, null: false, comment: "ロット管理対象"
    t.string "FGLISTSYOHIN", limit: 1, null: false, comment: "一覧表示対象"
    t.integer "UPDCOUNTER", default: 0
    t.index ["CDMAKER"], name: "IndexBT020WithCDMAKER"
    t.index ["TXHINBAN"], name: "BT020_SK1", unique: true
  end

  create_table "BT021", primary_key: ["NRSYOHIN", "NRCHILD"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRCHILD", limit: 7, null: false, comment: "構成品内部商品№"
    t.integer "RTKOUSEI", default: 0, null: false, comment: "構成数"
    t.string "FGNOUHIN", limit: 1, null: false
    t.integer "SQLIST", limit: 2, default: 0, comment: "構成一覧順"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN", "SQLIST"], name: "IndexBT021WithNRSYOHIN_SQLIST"
  end

  create_table "BT030", primary_key: "NRSOUKO", id: :string, limit: 5, comment: "倉庫№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSOUKO", limit: 20, null: false, comment: "倉庫名"
    t.string "TXSOUKOENG", limit: 30, comment: "倉庫名(英文)"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "TXJYUSYOENG", limit: 40, comment: "住所(英文)"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, null: false, comment: "FAX番号"
    t.string "NRDEFAULTLOCATION", limit: 5
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "BT031", primary_key: ["NRSOUKO", "NRLOCATION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "TXTEKIYO", limit: 20, comment: "摘要"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSOUKO"], name: "IndexBT031WithNRSOUKO"
  end

  create_table "CT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "仕入先№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXTANTOUBUSYO", limit: 30, null: false, comment: "仕入先担当部署"
    t.string "TXTANTOUSYA", limit: 40, comment: "仕入先担当者名"
    t.string "TXTANTOUSYASYOKUI", limit: 10, comment: "仕入先担当者職位"
    t.string "TXTANTOUSYAEMAIL", limit: 40, comment: "仕入先担当者メアド"
    t.string "TXTANTOUSYADENWA", limit: 20, comment: "仕入先担当者電話番号"
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false, comment: "支払方法区分"
    t.string "TXHURIKOMISAKI", limit: 50, comment: "振込銀行口座"
    t.integer "VLNYUKINSAITO", limit: 2, default: 0, null: false, comment: "支払入金サイト"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "仕入担当者№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.decimal "AMKISYUKAIKAKE", precision: 11, scale: 2, default: "0.0", comment: "期首買掛残高"
    t.decimal "AMKEIJYOU", precision: 11, scale: 2, default: "0.0", comment: "当期計上額"
    t.decimal "AMSIHARAI", precision: 11, scale: 2, default: "0.0", comment: "当期支払額"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "CT011", primary_key: ["NRSYOHIN", "NRTORIHIKISAKI", "DTHAKKOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTHAKKOU", null: false, comment: "発効日"
    t.date "DTSIKKOU", null: false, comment: "失効日"
    t.string "KBSIIREUM", limit: 5, null: false, comment: "仕入単位"
    t.integer "QTSIIRETANNI", default: 0, null: false, comment: "仕入単位数量"
    t.integer "VLKANZANKEISU", default: 0, null: false, comment: "仕入単位換算係数"
    t.decimal "PRSIIRETANKA", precision: 10, scale: 2, default: "0.0", null: false, comment: "契約仕入単価"
    t.integer "VLLEADTIME", limit: 2, default: 0, comment: "標準発注リードタイム"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN"], name: "IndexCT011WithNRSYOHIN"
    t.index ["NRTORIHIKISAKI"], name: "IndexCT011WithNRTORIHIKISAKI"
  end

  create_table "CT100", primary_key: "NRSIIRE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBSIIRE", limit: 2, null: false, comment: "仕入区分"
    t.date "DTSIIRE", null: false, comment: "仕入日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, comment: "内部商品№"
    t.string "TXSYOHIN", limit: 30, comment: "商品名"
    t.decimal "PRSIIRE", precision: 10, scale: 2, default: "0.0", comment: "標準仕入価格"
    t.string "KBCURRENCY", limit: 3, null: false, comment: "取引通貨"
    t.integer "QTSIIRE", default: 0, comment: "仕入数量"
    t.string "KBSIIREUM", limit: 5, null: false, comment: "仕入単位"
    t.decimal "AMSIIRE", precision: 11, scale: 2, default: "0.0", null: false, comment: "税抜仕入額"
    t.integer "AMTAX", default: 0, comment: "消費税額"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "NRSIHARAIIRAI", limit: 7, comment: "支払依頼№"
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexCT100WithDTCREATE"
    t.index ["NRSIHARAIIRAI"], name: "IndexCT100WithNRSIHARAIIRAI"
    t.index ["NRTORIHIKIKANRI", "NRSIIRE"], name: "IndexCT100WithNRTORIHIKIKANRI_NRSIIRE"
    t.index ["NRTORIHIKISAKI"], name: "IndexCT100WithNRTORIHIKISAKI"
  end

  create_table "CT110", primary_key: "NRSIHARAIIRAI", id: :string, limit: 7, comment: "支払依頼№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSIHARAIIRAI", null: false, comment: "依頼日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "TXSEIKYUNO", limit: 20, comment: "仕入先請求番号"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "FGSYOUNIN", limit: 1, null: false, comment: "支払承認フラグ"
    t.string "NRSIHARAI", limit: 7, comment: "支払指示№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false, comment: "支払方法区分"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSIHARAI"], name: "IndexCT110WithNRSIHARAI"
    t.index ["NRTORIHIKIKANRI"], name: "CT110_SK1", unique: true
  end

  create_table "CT120", primary_key: "NRSIHARAI", id: :string, limit: 7, comment: "支払指示№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSIHARAI", null: false, comment: "支払日"
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false, comment: "支払方法区分"
    t.string "KBCURRENCY", limit: 3, null: false, comment: "取引通貨"
    t.integer "AMNAIKASIHARAI", default: 0
    t.integer "AMTESURYO", default: 0, comment: "手数料"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "仕入先№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDKAKERITSURANK", limit: 2, null: false, comment: "掛率ランクＣ"
    t.string "TXTANTOUBUSYO", limit: 30, null: false, comment: "仕入先担当部署"
    t.string "TXTANTOUSYA", limit: 40, comment: "仕入先担当者名"
    t.string "TXTANTOUSYASYOKUI", limit: 10, comment: "仕入先担当者職位"
    t.string "TXTANTOUSYAEMAIL", limit: 40, comment: "仕入先担当者メアド"
    t.string "TXTANTOUSYADENWA", limit: 20, comment: "仕入先担当者電話番号"
    t.string "KBSEIKYUHOUSHIKI", limit: 2, null: false, comment: "請求方式区分"
    t.string "TXSIMEBI", limit: 10, comment: "締め日"
    t.string "CDNOUHINSYOYOSHIKI", limit: 4, comment: "納品書様式コード"
    t.string "KBNYUKINHOUHOU", limit: 2, null: false, comment: "標準入金方法区分"
    t.integer "VLNYUKINSAITO", limit: 2, default: 0, null: false, comment: "支払入金サイト"
    t.integer "AMYOSHIN", default: 0, null: false, comment: "与信限度額"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "仕入担当者№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "AMKISYUURIKAKE", default: 0, comment: "期首売掛残高"
    t.integer "AMKEIJYOU", default: 0, comment: "当期計上額"
    t.integer "AMKAISYU", default: 0, comment: "当期回収額"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTANTOUJYUGYOIN"], name: "IndexDT010WithNRTANTOUJYUGYOIN"
  end

  create_table "DT011", primary_key: ["NRTORIHIKISAKI", "SQSYUKKASAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false, comment: "出荷先行"
    t.string "TXKANJI", limit: 40, null: false, comment: "漢字名"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, comment: "FAX番号"
    t.integer "VLUNSOULT", limit: 2, default: 0, null: false, comment: "運送リードタイム"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT020", primary_key: "CDKAKERITSURANK", id: :string, limit: 2, comment: "掛率ランクＣ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKAKERITSURANK", limit: 20, null: false, comment: "ランク記述"
    t.decimal "VLKAKERITSU", precision: 3, scale: 2, default: "0.0", null: false, comment: "掛率"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT100", primary_key: "NRURIAGE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBURIAGE", limit: 2, null: false, comment: "売上区分"
    t.date "DTURIAGE", null: false, comment: "売上日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, comment: "内部商品№"
    t.string "TXSYOHIN", limit: 30, comment: "商品名"
    t.integer "PRHANBAI", default: 0, comment: "標準売価"
    t.integer "PRURIAGE", default: 0, comment: "売上単価"
    t.integer "QTURIAGE", default: 0, comment: "売上数量"
    t.string "KBURIAGEUM", limit: 5, null: false, comment: "売上単位区分"
    t.integer "AMURIAGE", default: 0, comment: "税抜売上額"
    t.integer "AMTAX", default: 0, comment: "消費税額"
    t.integer "AMGENKA", default: 0, comment: "売上原価"
    t.string "NRSEIKYU", limit: 7, comment: "請求№"
    t.string "NRJYUGYOIN", limit: 5, comment: "従業員№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexDT100WithDTCREATE"
    t.index ["NRTORIHIKIKANRI", "NRURIAGE"], name: "IndexDT100WithNRTORIHIKIKANRI_NRURIAGE"
    t.index ["NRTORIHIKISAKI"], name: "IndexDT100WithNRTORIHIKISAKI"
  end

  create_table "DT110", primary_key: "NRSEIKYU", id: :string, limit: 7, comment: "請求№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSEIKYU", null: false, comment: "請求日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTHAKKOU", comment: "発効日"
    t.date "DTNYUKIN", comment: "入金確認日"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "DT120", primary_key: "NRJYURYOU", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTJYURYOU", null: false, comment: "受領日"
    t.string "KBNYUKINHOUHOU", limit: 2, null: false, comment: "標準入金方法区分"
    t.integer "AMJYURYOU", default: 0, null: false, comment: "受領額"
    t.integer "AMTESURYOU", default: 0, comment: "手数料額"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "DT120_SK1", unique: true
  end

  create_table "ET010", primary_key: ["NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.integer "QTANZENZAIKO", default: 0, comment: "安全在庫省略値"
    t.integer "QTJYOUGENZAIKO", default: 0, comment: "上限在庫省略値"
    t.integer "QTKISYUZAIKO", default: 0, comment: "期首在庫数"
    t.integer "QTNYUKO", default: 0, comment: "当期入庫数"
    t.integer "QTSYUKKO", default: 0, comment: "当期出庫数"
    t.integer "AMKISYUZAIKO", default: 0, comment: "期首在庫額"
    t.integer "AMNYUKO", default: 0, comment: "当期入庫額"
    t.integer "AMSYUKKO", default: 0, comment: "当期出庫額"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSOUKO"], name: "IndexET010WithNRSOUKO"
  end

  create_table "ET100", primary_key: "NRUKEBARAI", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBUKEBARAI", limit: 2, null: false, comment: "受払区分"
    t.date "DTUKEBARAI", null: false, comment: "受払日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "NRIDOUSOUKO", limit: 5, comment: "移動倉庫№"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, comment: "出荷先行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "TXLOTNUMBER", limit: 40, null: false, comment: "ロット№"
    t.integer "QTUKEBARAI", default: 0, comment: "受払数量"
    t.integer "AMUKEBARAI", default: 0, comment: "受払金額"
    t.integer "AMSAGAKU", default: 0, comment: "取引差額"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.timestamp "DTCREATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.integer "UPDCOUNTER", default: 0
    t.index ["DTCREATE"], name: "IndexET100WithDTCREATE"
    t.index ["NRTORIHIKIKANRI", "NRUKEBARAI"], name: "IndexET100WithNRTORIHIKIKANRI_NRUKEBARAI"
  end

  create_table "ET200", primary_key: "NRTORIHIKIKANRI", id: :string, limit: 7, comment: "取引管理№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBYOTEI", limit: 2, null: false, comment: "受払予定区分"
    t.date "DTYOTEI", null: false, comment: "受払予定日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRIDOUSOUKO", limit: 5, comment: "移動倉庫№"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "QTYOTEI", default: 0, comment: "受払予定数"
    t.string "NRSANSYOU", limit: 15, null: false, comment: "参照№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYOHIN", "NRSOUKO"], name: "IndexET200WithNRSYOHIN_NRSOUKO"
  end

  create_table "FT010", primary_key: "NRHATTYU", id: :string, limit: 7, comment: "発注№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTHATTYU", null: false, comment: "発注日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRJYUGYOIN", limit: 5, null: false, comment: "従業員№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "FGKAKUNIN", limit: 1, null: false, comment: "納期確認"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTKIBOUNOUKI", comment: "希望納期初期値"
    t.date "DTHAKKOU", comment: "発効日"
    t.date "DTTORIKESHI", comment: "取消日"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "FT011", primary_key: ["NRHATTYU", "SQHATTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false, comment: "発注№"
    t.integer "SQHATTYU", limit: 2, default: 0, null: false, comment: "発注行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.decimal "PRHATTYU", precision: 10, scale: 2, default: "0.0", null: false, comment: "発注単価"
    t.integer "QTHATTYU", default: 0, null: false, comment: "発注数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期初期値"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "FT012", primary_key: ["NRHATTYU", "SQHATTYU", "SQNYUKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false, comment: "発注№"
    t.integer "SQHATTYU", limit: 2, default: 0, null: false, comment: "発注行"
    t.integer "SQNYUKA", limit: 2, default: 0, null: false, comment: "入荷行"
    t.date "DTYOTEINYUKA", null: false, comment: "予定入荷日"
    t.string "FGKAKUNIN", limit: 1, null: false, comment: "納期確認"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "QTYOTEISIIRE", default: 0, null: false, comment: "仕入予定数"
    t.integer "QTJITSUSIIRE", default: 0, comment: "実際仕入数"
    t.integer "QTDEFECT", default: 0, comment: "不合格数"
    t.decimal "PRSIIRE", precision: 10, scale: 2, default: "0.0", null: false, comment: "標準仕入価格"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "NRNYUKA", limit: 7, comment: "入荷№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "FT012_SK1", unique: true
  end

  create_table "FT020", primary_key: "NRNYUKA", id: :string, limit: 7, comment: "入荷№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTNYUKA", null: false, comment: "実際入荷日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT010", primary_key: "NRJYUTYU", id: :string, limit: 7, comment: "受注№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTJYUTYU", null: false, comment: "受注日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false, comment: "出荷先行"
    t.string "TXTYUBAN", limit: 15, comment: "顧客注文番号"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTTORIKESHI", comment: "取消日"
    t.string "NRMITSUMORI", limit: 7, comment: "見積№"
    t.integer "SQVERSION", limit: 2, default: 0, comment: "見積版№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRMITSUMORI", "SQVERSION"], name: "IndexGT010WithNRMITSUMORI_SQVERSION"
  end

  create_table "GT011", primary_key: ["NRJYUTYU", "SQJYUTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false, comment: "受注№"
    t.integer "SQJYUTYU", limit: 2, default: 0, null: false, comment: "受注行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "PRJYUTYU", default: 0, null: false, comment: "受注単価"
    t.integer "QTJYUTYU", default: 0, null: false, comment: "受注数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期初期値"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKISAKI"], name: "IndexGT011WithNRTORIHIKISAKI"
  end

  create_table "GT012", primary_key: ["NRJYUTYU", "SQJYUTYU", "SQSYUKKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false, comment: "受注№"
    t.integer "SQJYUTYU", limit: 2, default: 0, null: false, comment: "受注行"
    t.integer "SQSYUKKA", limit: 2, default: 0, null: false, comment: "出荷行"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.date "DTYOTEISYUKKA", null: false, comment: "予定出荷日"
    t.integer "QTYOTEISYUKKA", default: 0, null: false, comment: "出荷指示数"
    t.integer "QTJITSUSYUKKA", default: 0, comment: "出荷実績数"
    t.integer "QTTORIKESHI", default: 0, comment: "出荷取消数"
    t.integer "PRSYUKKO", default: 0, comment: "出庫単価"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRSYUKKA", limit: 7, comment: "出荷№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRSYUKKA"], name: "IndexGT012WithNRSYUKKA"
    t.index ["NRTORIHIKIKANRI"], name: "GT012_SK1", unique: true
  end

  create_table "GT020", primary_key: "NRSYUKKA", id: :string, limit: 7, comment: "出荷№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false, comment: "出荷先行"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.date "DTSYUKKA", null: false, comment: "出荷日"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRSEIKYU", limit: 7, comment: "請求№"
    t.datetime "TMHAKKOU", comment: "発行日時"
    t.datetime "TMKANRYO", comment: "完了日時"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT030", primary_key: ["NRMITSUMORI", "SQVERSION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false, comment: "見積№"
    t.integer "SQVERSION", limit: 2, default: 0, null: false, comment: "見積版№"
    t.date "DTMITSUMORI", null: false, comment: "見積日"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, comment: "出荷先行"
    t.string "TXKOKYAKUMEI", limit: 40, comment: "未登録顧客名"
    t.string "TXTYUBAN", limit: 15, comment: "顧客注文番号"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "GT031", primary_key: ["NRMITSUMORI", "SQVERSION", "SQMITSUMORI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false, comment: "見積№"
    t.integer "SQVERSION", limit: 2, default: 0, null: false, comment: "見積版№"
    t.integer "SQMITSUMORI", limit: 2, default: 0, null: false, comment: "見積行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "PRJYUTYU", default: 0, null: false, comment: "受注単価"
    t.integer "QTJYUTYU", default: 0, null: false, comment: "受注数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期初期値"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "HT010", primary_key: "NRSIIREHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBSIIREHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.decimal "AMTORIHIKI", precision: 10, scale: 2, default: "0.0", null: false, comment: "税抜取引額"
    t.string "TXTEKIYO", limit: 30, null: false, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "HT010_SK1", unique: true
  end

  create_table "HT020", primary_key: "NRTOKUSYUSIIRE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUSIIRE", limit: 2, null: false, comment: "取引区分"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.decimal "PRTORIHIKI", precision: 10, scale: 2, default: "0.0", null: false, comment: "取引単価"
    t.integer "QTTORIHIKI", default: 0, null: false, comment: "取引数量"
    t.string "KBTORIHIKIUM", limit: 5, null: false, comment: "取引単位区分"
    t.integer "PRUKEBARAI", default: 0, comment: "受払単価"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "HT020_SK1", unique: true
  end

  create_table "JT010", primary_key: "NRURIAGEHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBURIAGEHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "AMTORIHIKI", default: 0, null: false, comment: "税抜取引額"
    t.string "TXTEKIYO", limit: 30, null: false, comment: "摘要"
    t.string "NRSEIKYU", limit: 7, comment: "請求№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "JT010_SK1", unique: true
  end

  create_table "JT020", primary_key: "NRTOKUSYUURIAGE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUURIAGE", limit: 2, null: false, comment: "取引区分"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "SQSYUKKASAKI", limit: 2, default: 0, null: false, comment: "出荷先行"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.integer "PRTORIHIKI", default: 0, null: false, comment: "取引単価"
    t.integer "QTTORIHIKI", default: 0, null: false, comment: "取引数量"
    t.integer "PRUKEBARAI", default: 0, comment: "受払単価"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRSEIKYU", limit: 7, comment: "請求№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "JT020_SK1", unique: true
  end

  create_table "KT010", primary_key: "NRTANAOROSHI", id: :string, limit: 7, comment: "棚卸№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.datetime "DTKIJYUN", comment: "調査基準日時"
    t.datetime "DTKOUSHIN", comment: "確定更新日時"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT010_SK1", unique: true
  end

  create_table "KT011", primary_key: ["NRTANAOROSHI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTANAOROSHI", limit: 7, null: false, comment: "棚卸№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.integer "PRUKEBARAI", default: 0, null: false, comment: "受払単価"
    t.integer "QTTYOUBO", default: 0, comment: "帳簿在庫数量"
    t.integer "QTJITSUTANA", default: 0, comment: "実棚数量"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "KT020", primary_key: "NRZAIKOIDOU", id: :string, limit: 7, comment: "移動指示№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSHIJI", null: false, comment: "指示日"
    t.string "NRSOUKOFROM", limit: 5, null: false, comment: "元倉庫№"
    t.string "NRSOUKOTO", limit: 5, null: false, comment: "先倉庫№"
    t.date "DTKANRYOYOTEI", null: false, comment: "完了予定日"
    t.datetime "TMHAKKOU", comment: "発行日時"
    t.datetime "TMKANRYO", comment: "完了日時"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT020_SK1", unique: true
  end

  create_table "KT021", primary_key: ["NRZAIKOIDOU", "SQZAIKOIDOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRZAIKOIDOU", limit: 7, null: false, comment: "移動指示№"
    t.integer "SQZAIKOIDOU", limit: 2, default: 0, null: false, comment: "指示行"
    t.string "NRLOCATIONTO", limit: 5, comment: "先ロケ№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.integer "QTIDOU", default: 0, null: false, comment: "移動数量"
    t.integer "PRIDOU", default: 0, comment: "取引単価"
    t.string "NRTORIHIKIKANRIFROM", limit: 7, null: false, comment: "出庫管理№"
    t.string "NRTORIHIKIKANRITO", limit: 7, null: false, comment: "入庫管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRIFROM"], name: "KT021_SK1", unique: true
    t.index ["NRTORIHIKIKANRITO"], name: "KT021_SK2", unique: true
  end

  create_table "KT030", primary_key: "NRZAIKOHURIKAE", id: :string, limit: 7, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBZAIKOHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTHURIKAE", null: false, comment: "振替日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.integer "QTHURIKAE", default: 0, comment: "振替数量"
    t.integer "AMHURIKAE", default: 0, comment: "振替金額"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "KT030_SK1", unique: true
  end

  create_table "LT010", primary_key: "NRSET", id: :string, limit: 7, comment: "セット指示№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.date "DTYOTEI", null: false, comment: "受払予定日"
    t.datetime "TMHAKKOU", comment: "発行日時"
    t.datetime "TMJISSEKI", comment: "実際完了日時"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "QTSHIJI", default: 0, null: false, comment: "予定セット数"
    t.integer "QTJISSEKI", default: 0, comment: "実績セット数"
    t.integer "AMJISSEKI", default: 0, comment: "実績取引額"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "LT010_SK1", unique: true
  end

  create_table "LT011", primary_key: ["NRSET", "SQKOUSEI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSET", limit: 7, null: false, comment: "セット指示№"
    t.integer "SQKOUSEI", limit: 2, default: 0, null: false, comment: "構成行"
    t.string "NRCHILD", limit: 7, null: false, comment: "構成品内部商品№"
    t.integer "QTSHIJI", default: 0, comment: "予定セット数"
    t.integer "QTJISSEKI", default: 0, comment: "実績セット数"
    t.integer "PRTORIHIKI", default: 0, comment: "取引単価"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "UPDCOUNTER", default: 0
    t.index ["NRTORIHIKIKANRI"], name: "LT011_SK1", unique: true
  end

  create_table "YT010", primary_key: "DTNEND", id: :integer, limit: 2, default: 0, comment: "取引年度", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "AMURIKISYUZAN", default: 0, comment: "期首売掛残高"
    t.bigint "AMURISYUK", default: 0, comment: "期間出荷売上額"
    t.bigint "AMURITYOK", default: 0, comment: "期間直出荷売上"
    t.bigint "AMURIHENPIN", default: 0, comment: "期間出荷返品額"
    t.bigint "AMURIZATSUEKI", default: 0, comment: "期間雑益売上額"
    t.bigint "AMURIZATSUSON", default: 0, comment: "期間雑損振替額"
    t.bigint "AMURISOUSAI", default: 0, comment: "期間売上相殺額"
    t.bigint "AMURINEBIKI", default: 0, comment: "期間営業値引額"
    t.bigint "AMURIHANHURI", default: 0, comment: "期間販売費振替"
    t.bigint "AMURIJYURYO", default: 0, comment: "期間売上受領額"
    t.bigint "AMURIGENKA", default: 0, comment: "期間売上原価"
    t.bigint "AMURITAX", default: 0, comment: "期間売上消費税"
    t.bigint "AMKAIKISYUZAN", default: 0, comment: "期首買掛残高"
    t.bigint "AMKAINYUK", default: 0, comment: "期間入荷仕入額"
    t.bigint "AMKAITYOK", default: 0, comment: "期間直入荷仕入"
    t.bigint "AMKAIHENPIN", default: 0, comment: "期間入荷返品額"
    t.bigint "AMKAIZATSUEKI", default: 0, comment: "期間雑益振替額"
    t.bigint "AMKAIZATSUSON", default: 0, comment: "期間雑損仕入額"
    t.bigint "AMKAISOUSAI", default: 0, comment: "期間仕入相殺額"
    t.bigint "AMKAIGENKA", default: 0, comment: "期間原価振替額"
    t.bigint "AMKAISIHARAI", default: 0, comment: "期間仕入支払額"
    t.bigint "AMKAITAX", default: 0, comment: "期間仕入消費税"
    t.bigint "AMZAIKISYUZAN", default: 0, comment: "期首在庫残高"
    t.bigint "AMZAINYUK", default: 0, comment: "期間仕入入庫額"
    t.bigint "AMZAINYUKHEN", default: 0, comment: "期間仕入返品額"
    t.bigint "AMZAISYUK", default: 0, comment: "期間売上出庫額"
    t.bigint "AMZAISYUKHEN", default: 0, comment: "期間売上返品額"
    t.bigint "AMZAIIDOU", default: 0, comment: "期間移動額"
    t.bigint "AMZAIGENMOU", default: 0, comment: "期間減耗額"
    t.bigint "AMZAIHYOKAZON", default: 0, comment: "期間評価損額"
    t.bigint "AMZAIHYOKAEKI", default: 0, comment: "期間評価益額"
    t.bigint "AMZAISIKAKARI", default: 0, comment: "期間仕掛出庫額"
    t.bigint "AMZAIZATSUSON", default: 0, comment: "期間雑損額"
    t.bigint "AMZAIZATSUEKI", default: 0, comment: "期間雑益額"
    t.bigint "AMZAIKANSEI", default: 0, comment: "期間完成入庫額"
    t.bigint "AMZAIKAKOUHI", default: 0, comment: "期間加工費繰入"
    t.bigint "AMZAIZOUGEN", default: 0, comment: "期間棚増減額"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT020", primary_key: ["DTNEND", "DTMSEQ"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.integer "AMURIKISYUZAN", default: 0, comment: "期首売掛残高"
    t.integer "AMURISYUK", default: 0, comment: "期間出荷売上額"
    t.integer "AMURITYOK", default: 0, comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", default: 0, comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", default: 0, comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", default: 0, comment: "期間雑損振替額"
    t.integer "AMURISOUSAI", default: 0, comment: "期間売上相殺額"
    t.integer "AMURINEBIKI", default: 0, comment: "期間営業値引額"
    t.integer "AMURIHANHURI", default: 0, comment: "期間販売費振替"
    t.integer "AMURIJYURYO", default: 0, comment: "期間売上受領額"
    t.integer "AMURIGENKA", default: 0, comment: "期間売上原価"
    t.integer "AMURITAX", default: 0, comment: "期間売上消費税"
    t.integer "AMKAIKISYUZAN", default: 0, comment: "期首買掛残高"
    t.integer "AMKAINYUK", default: 0, comment: "期間入荷仕入額"
    t.integer "AMKAITYOK", default: 0, comment: "期間直入荷仕入"
    t.integer "AMKAIHENPIN", default: 0, comment: "期間入荷返品額"
    t.integer "AMKAIZATSUEKI", default: 0, comment: "期間雑益振替額"
    t.integer "AMKAIZATSUSON", default: 0, comment: "期間雑損仕入額"
    t.integer "AMKAISOUSAI", default: 0, comment: "期間仕入相殺額"
    t.integer "AMKAIGENKA", default: 0, comment: "期間原価振替額"
    t.integer "AMKAISIHARAI", default: 0, comment: "期間仕入支払額"
    t.integer "AMKAITAX", default: 0, comment: "期間仕入消費税"
    t.integer "AMZAIKISYUZAN", default: 0, comment: "期首在庫残高"
    t.integer "AMZAINYUK", default: 0, comment: "期間仕入入庫額"
    t.integer "AMZAINYUKHEN", default: 0, comment: "期間仕入返品額"
    t.integer "AMZAISYUK", default: 0, comment: "期間売上出庫額"
    t.integer "AMZAISYUKHEN", default: 0, comment: "期間売上返品額"
    t.integer "AMZAIIDOU", default: 0, comment: "期間移動額"
    t.integer "AMZAIGENMOU", default: 0, comment: "期間減耗額"
    t.integer "AMZAIHYOKAZON", default: 0, comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", default: 0, comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", default: 0, comment: "期間仕掛出庫額"
    t.integer "AMZAIZATSUSON", default: 0, comment: "期間雑損額"
    t.integer "AMZAIZATSUEKI", default: 0, comment: "期間雑益額"
    t.integer "AMZAIKANSEI", default: 0, comment: "期間完成入庫額"
    t.integer "AMZAIKAKOUHI", default: 0, comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", default: 0, comment: "期間棚増減額"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT030", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMZAIKISYUZAN", default: 0, comment: "期首在庫残高"
    t.integer "QTZAIKISYUZAN", default: 0, comment: "期首在庫残数"
    t.integer "AMZAINYUK", default: 0, comment: "期間仕入入庫額"
    t.integer "QTZAINYUK", default: 0, comment: "期間仕入入庫数"
    t.integer "AMZAINYUKHEN", default: 0, comment: "期間仕入返品額"
    t.integer "QTZAINYUKHEN", default: 0, comment: "期間仕入返品数"
    t.integer "AMZAISYUK", default: 0, comment: "期間売上出庫額"
    t.integer "QTZAISYUK", default: 0, comment: "期間売上出庫数"
    t.integer "AMZAISYUKHEN", default: 0, comment: "期間売上返品額"
    t.integer "QTZAISYUKHEN", default: 0, comment: "期間売上返品数"
    t.integer "AMZAIIDOU", default: 0, comment: "期間移動額"
    t.integer "QTZAIIDOU", default: 0, comment: "期間移動数"
    t.integer "AMZAIGENMOU", default: 0, comment: "期間減耗額"
    t.integer "QTZAIGENMOU", default: 0, comment: "期間減耗数"
    t.integer "AMZAIHYOKAZON", default: 0, comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", default: 0, comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", default: 0, comment: "期間仕掛出庫額"
    t.integer "QTZAISIKAKARI", default: 0, comment: "期間仕掛出庫数"
    t.integer "AMZAIZATSUSON", default: 0, comment: "期間雑損額"
    t.integer "QTZAIZATSUSON", default: 0, comment: "期間雑損数"
    t.integer "AMZAIZATSUEKI", default: 0, comment: "期間雑益額"
    t.integer "QTZAIZATSUEKI", default: 0, comment: "期間雑益数"
    t.integer "AMZAIKANSEI", default: 0, comment: "期間完成入庫額"
    t.integer "QTZAIKANSEI", default: 0, comment: "期間完成入庫数"
    t.integer "AMZAIKAKOUHI", default: 0, comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", default: 0, comment: "期間棚増減額"
    t.integer "QTZAIZOUGEN", default: 0, comment: "期間棚増減数"
    t.integer "AMZAIARARI", default: 0, comment: "期間粗利額"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT031", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.integer "AMZAIKISYUZAN", default: 0, comment: "期首在庫残高"
    t.integer "QTZAIKISYUZAN", default: 0, comment: "期首在庫残数"
    t.integer "AMZAINYUK", default: 0, comment: "期間仕入入庫額"
    t.integer "QTZAINYUK", default: 0, comment: "期間仕入入庫数"
    t.integer "AMZAINYUKHEN", default: 0, comment: "期間仕入返品額"
    t.integer "QTZAINYUKHEN", default: 0, comment: "期間仕入返品数"
    t.integer "AMZAISYUK", default: 0, comment: "期間売上出庫額"
    t.integer "QTZAISYUK", default: 0, comment: "期間売上出庫数"
    t.integer "AMZAISYUKHEN", default: 0, comment: "期間売上返品額"
    t.integer "QTZAISYUKHEN", default: 0, comment: "期間売上返品数"
    t.integer "AMZAIIDOU", default: 0, comment: "期間移動額"
    t.integer "QTZAIIDOU", default: 0, comment: "期間移動数"
    t.integer "AMZAIGENMOU", default: 0, comment: "期間減耗額"
    t.integer "QTZAIGENMOU", default: 0, comment: "期間減耗数"
    t.integer "AMZAIHYOKAZON", default: 0, comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", default: 0, comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", default: 0, comment: "期間仕掛出庫額"
    t.integer "QTZAISIKAKARI", default: 0, comment: "期間仕掛出庫数"
    t.integer "AMZAIZATSUSON", default: 0, comment: "期間雑損額"
    t.integer "QTZAIZATSUSON", default: 0, comment: "期間雑損数"
    t.integer "AMZAIZATSUEKI", default: 0, comment: "期間雑益額"
    t.integer "QTZAIZATSUEKI", default: 0, comment: "期間雑益数"
    t.integer "AMZAIKANSEI", default: 0, comment: "期間完成入庫額"
    t.integer "QTZAIKANSEI", default: 0, comment: "期間完成入庫数"
    t.integer "AMZAIKAKOUHI", default: 0, comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", default: 0, comment: "期間棚増減額"
    t.integer "QTZAIZOUGEN", default: 0, comment: "期間棚増減数"
    t.integer "AMZAIARARI", default: 0, comment: "期間粗利額"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT040", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "AMKAIKISYUZAN", default: 0, comment: "期首買掛残高"
    t.integer "AMKAINYUK", default: 0, comment: "期間入荷仕入額"
    t.integer "AMKAITYOK", default: 0, comment: "期間直入荷仕入"
    t.integer "AMKAIHENPIN", default: 0, comment: "期間入荷返品額"
    t.integer "AMKAIZATSUEKI", default: 0, comment: "期間雑益振替額"
    t.integer "AMKAIZATSUSON", default: 0, comment: "期間雑損仕入額"
    t.integer "AMKAISOUSAI", default: 0, comment: "期間仕入相殺額"
    t.integer "AMKAIGENKA", default: 0, comment: "期間原価振替額"
    t.integer "AMKAISIHARAI", default: 0, comment: "期間仕入支払額"
    t.integer "AMKAITAX", default: 0, comment: "期間仕入消費税"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT041", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMKAINYUK", default: 0, comment: "期間入荷仕入額"
    t.integer "QTKAINYUK", default: 0, comment: "期間入荷仕入数"
    t.integer "AMKAITYOK", default: 0, comment: "期間直入荷仕入"
    t.integer "QTKAITYOK", default: 0, comment: "期間直入荷仕入数"
    t.integer "AMKAIHENPIN", default: 0, comment: "期間入荷返品額"
    t.integer "QTKAIHENPIN", default: 0, comment: "期間入荷返品数"
    t.integer "AMKAIGENKA", default: 0, comment: "期間原価振替額"
    t.integer "AMKAITAX", default: 0, comment: "期間仕入消費税"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT050", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "AMURIKISYUZAN", default: 0, comment: "期首売掛残高"
    t.integer "AMURISYUK", default: 0, comment: "期間出荷売上額"
    t.integer "AMURITYOK", default: 0, comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", default: 0, comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", default: 0, comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", default: 0, comment: "期間雑損振替額"
    t.integer "AMURISOUSAI", default: 0, comment: "期間売上相殺額"
    t.integer "AMURINEBIKI", default: 0, comment: "期間営業値引額"
    t.integer "AMURIHANHURI", default: 0, comment: "期間販売費振替"
    t.integer "AMURIJYURYO", default: 0, comment: "期間売上受領額"
    t.integer "AMURIGENKA", default: 0, comment: "期間売上原価"
    t.integer "AMURITAX", default: 0, comment: "期間売上消費税"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT051", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMURISYUK", default: 0, comment: "期間出荷売上額"
    t.integer "QTURISYUK", default: 0, comment: "期間出荷売上数"
    t.integer "AMURITYOK", default: 0, comment: "期間直出荷売上"
    t.integer "QTURITYOK", default: 0, comment: "期間直出荷売上数"
    t.integer "AMURIHENPIN", default: 0, comment: "期間出荷返品額"
    t.integer "QTURIHENPIN", default: 0, comment: "期間出荷返品数"
    t.integer "AMURINEBIKI", default: 0, comment: "期間営業値引額"
    t.integer "AMURIHANHURI", default: 0, comment: "期間販売費振替"
    t.integer "AMURIGENKA", default: 0, comment: "期間売上原価"
    t.integer "AMURITAX", default: 0, comment: "期間売上消費税"
    t.integer "UPDCOUNTER", default: 0
  end

  create_table "YT060", primary_key: ["DTNEND", "DTMSEQ", "NRTANTOUJYUGYOIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, default: 0, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, default: 0, null: false, comment: "取引月序"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "仕入担当者№"
    t.integer "AMURISYUK", default: 0, comment: "期間出荷売上額"
    t.integer "AMURITYOK", default: 0, comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", default: 0, comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", default: 0, comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", default: 0, comment: "期間雑損振替額"
    t.integer "AMURINEBIKI", default: 0, comment: "期間営業値引額"
    t.integer "AMURIHANHURI", default: 0, comment: "期間販売費振替"
    t.integer "AMURIGENKA", default: 0, comment: "期間売上原価"
    t.integer "AMURITAX", default: 0, comment: "期間売上消費税"
    t.integer "UPDCOUNTER", default: 0
  end

end
