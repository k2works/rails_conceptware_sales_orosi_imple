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
  end

  create_table "AT011", primary_key: ["CDBUMON", "DTHAKKOUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDBUMON", limit: 5, null: false, comment: "部門C"
    t.string "DTHAKKOUNENGETSU", limit: 6, null: false, comment: "発効年月"
    t.string "CDJYOUIBUMON", limit: 5, null: false, comment: "上位部門C"
    t.string "DTSIKKOUNENGETSU", limit: 6, comment: "失効年月"
    t.index ["CDJYOUIBUMON"], name: "AT011_FK1"
  end

  create_table "AT020", primary_key: "NRJYUGYOIN", id: :string, limit: 5, comment: "従業員№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKANA", limit: 30, null: false, comment: "カナ名"
    t.string "TXKANJI", limit: 30, null: false, comment: "漢字名"
    t.string "KBKOYOU", limit: 2, null: false, comment: "雇用区分"
    t.date "DTNYUSYA", null: false, comment: "入社日"
    t.date "DTTAISYA", comment: "退社日"
  end

  create_table "AT021", primary_key: ["NRJYUGYOIN", "DTSYOZOKUNENGETSU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUGYOIN", limit: 5, null: false, comment: "従業員№"
    t.string "DTSYOZOKUNENGETSU", limit: 6, null: false, comment: "所属発効年月"
    t.string "CDBUMON", limit: 5, null: false, comment: "部門C"
    t.string "DTLASTNENGETSU", limit: 6, null: false, comment: "所属最終年月"
    t.string "KBPRESENT", limit: 1, null: false, comment: "現行メンバー区分"
    t.index ["CDBUMON"], name: "AT021_FK2"
  end

  create_table "AT030", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "取引先№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "FGKOKYAKU", limit: 1, null: false, comment: "顧客対象FLAG"
    t.string "FGSIIRESAKI", limit: 1, null: false, comment: "仕入先対象FLAG"
    t.index ["TXKANJI"], name: "AT030_SK1", unique: true
  end

  create_table "BT010", primary_key: "CDMAKER", id: :string, limit: 5, comment: "メーカー№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXMAKER", limit: 40, null: false, comment: "メーカー名"
    t.string "TXMAKERABR", limit: 10, null: false, comment: "メーカー略称"
    t.string "KBCOUNTRY", limit: 3, null: false, comment: "国コード"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, null: false, comment: "FAX番号"
    t.string "TXURL", limit: 40, comment: "ＵＲＬ"
    t.string "TXEMAIL", limit: 40, comment: "担当者メアド"
  end

  create_table "BT020", primary_key: "NRSYOHIN", id: :string, limit: 7, comment: "内部商品№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSYOHIN", limit: 30, null: false, comment: "商品名"
    t.string "TXHINBAN", limit: 20, null: false, comment: "品番"
    t.string "TXSIYOU", limit: 50, comment: "仕様"
    t.string "TXIMAGEFILENAME", limit: 30, null: false, comment: "外観"
    t.string "KBSYOHIN", limit: 5, null: false, comment: "商品群区分"
    t.string "CDMAKER", limit: 5, null: false, comment: "メーカーＣ"
    t.integer "PRHANBAI", comment: "標準売価"
    t.integer "PRSIIRE", comment: "標準仕入価格"
    t.string "KBZAIKOUM", limit: 2, null: false, comment: "在庫単位区分"
    t.integer "QTHANBAIUNIT", null: false, comment: "販売単位数"
    t.integer "QTANZENZAIKO", comment: "安全在庫省略値"
    t.integer "QTJYOUGENZAIKO", null: false, comment: "上限在庫省略値"
    t.string "FGLOTKANRI", limit: 1, null: false, comment: "ロット管理対象"
    t.string "FGLISTSYOHIN", limit: 1, null: false, comment: "一覧表示対象"
    t.integer "PRARARI", comment: "標準粗利"
    t.index ["CDMAKER"], name: "BT020_FK1"
    t.index ["TXHINBAN"], name: "BT020_SK1", unique: true
  end

  create_table "BT021", primary_key: ["NRSYOHIN", "NRCHILD"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRCHILD", limit: 7, null: false, comment: "構成品内部商品№"
    t.integer "RTKOUSEI", null: false, comment: "構成数"
    t.integer "SQLIST", limit: 2, comment: "構成一覧順"
  end

  create_table "BT030", primary_key: "NRSOUKO", id: :string, limit: 5, comment: "倉庫№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXSOUKO", limit: 20, null: false, comment: "倉庫名"
    t.string "TXSOUKOENG", limit: 30, comment: "倉庫名(英文)"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "TXJYUSYOENG", limit: 40, comment: "住所(英文)"
    t.string "NRDENWA", limit: 14, null: false, comment: "電話番号"
    t.string "NRFAX", limit: 14, null: false, comment: "FAX番号"
  end

  create_table "BT031", primary_key: ["NRSOUKO", "NRLOCATION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "TXTEKIYO", limit: 20, null: false, comment: "摘要"
  end

  create_table "CT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "仕入先№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXTANTOUBUSYO", limit: 30, null: false, comment: "仕入先担当部署"
    t.string "TXTANTOUSYA", limit: 40, comment: "仕入先担当者名"
    t.string "TXTANTOUSYASYOKUI", limit: 10, comment: "仕入先担当者職位"
    t.string "TXTANTOUSYAEMAIL", limit: 40, comment: "仕入先担当者メアド"
    t.string "TXTANTOUSYADENWA", limit: 20, comment: "仕入先担当者電話番号"
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false, comment: "支払方法区分"
    t.string "TXHURIKOMISAKI", limit: 50, comment: "振込銀行口座"
    t.integer "VLNYUKINSAITO", limit: 2, null: false, comment: "支払入金サイト"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "仕入担当者№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.decimal "AMKISYUKAIKAKE", precision: 11, scale: 2, comment: "期首買掛残高"
    t.decimal "AMKEIJYOU", precision: 11, scale: 2, comment: "当期計上額"
    t.decimal "AMSIHARAI", precision: 11, scale: 2, comment: "当期支払額"
    t.decimal "AMGENKAIKAKE", precision: 11, scale: 2, comment: "現買掛残高"
  end

  create_table "CT011", primary_key: ["NRSYOHIN", "NRTORIHIKISAKI", "DTHAKKOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTHAKKOU", null: false, comment: "発効日"
    t.date "DTSIKKOU", null: false, comment: "失効日"
    t.string "KBSIIREUM", limit: 5, null: false, comment: "仕入単位"
    t.integer "QTSIIRETANNI", null: false, comment: "仕入単位数量"
    t.integer "VLKANZANKEISU", null: false, comment: "仕入単位換算係数"
    t.decimal "PRSIIRETANKA", precision: 11, scale: 2, null: false, comment: "契約仕入単価"
    t.integer "VLLEADTIME", limit: 2, comment: "標準発注リードタイム"
    t.index ["NRTORIHIKISAKI"], name: "CT011_FK2"
  end

  create_table "CT100", primary_key: "NRSIIRE", id: :string, limit: 7, comment: "買掛増減№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBSIIRE", limit: 2, null: false, comment: "仕入区分"
    t.date "DTSIIRE", null: false, comment: "仕入日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, comment: "仕入商品№"
    t.string "TXSYOHIN", limit: 30, comment: "商品名／摘要"
    t.decimal "PRSIIRE", precision: 10, scale: 2, comment: "仕入単価"
    t.string "KBCURRENCY", limit: 3, comment: "通貨"
    t.integer "QTSIIRE", comment: "仕入数量"
    t.string "KBSIIREUM", limit: 5, comment: "仕入単位区分"
    t.decimal "AMSIIRE", precision: 11, scale: 2, null: false, comment: "税抜仕入額"
    t.integer "AMTAX", comment: "消費税額"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "NRSIHARAIIRAI", limit: 7, comment: "支払依頼№"
    t.datetime "DTCREATE", null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "取引月序"
    t.decimal "AMSIIRENAIKA", precision: 11, scale: 2, null: false, comment: "税抜内貨仕入額"
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
    t.decimal "AMSIHARAI", precision: 11, scale: 2, comment: "税抜支払依頼額"
    t.integer "AMSIHARAINAIKA", comment: "税抜内貨支払額"
    t.integer "AMTAX", comment: "消費税額"
    t.index ["NRTORIHIKIKANRI"], name: "CT110_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "CT110_FK1"
  end

  create_table "CT120", primary_key: "NRSIHARAI", id: :string, limit: 7, comment: "支払指示№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSIHARAI", null: false, comment: "支払日"
    t.string "KBSIHARAIHOUHOU", limit: 2, null: false, comment: "支払方法区分"
    t.string "KBCURRENCY", limit: 3, comment: "通貨"
    t.integer "AMJITSUSIHARAI", comment: "内貨実際支払額"
    t.integer "AMTESURYO", comment: "手数料"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.decimal "AMSIHARAI", precision: 11, scale: 2, comment: "税込支払指示額"
  end

  create_table "DT010", primary_key: "NRTORIHIKISAKI", id: :string, limit: 8, comment: "顧客№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDKAKERITSURANK", limit: 2, null: false, comment: "掛率ランクＣ"
    t.string "TXTANTOUBUSYO", limit: 30, null: false, comment: "客先担当部署"
    t.string "TXTANTOUSYA", limit: 40, comment: "客先担当者名"
    t.string "TXTANTOUSYASYOKUI", limit: 10, comment: "客先担当者職位"
    t.string "TXTANTOUSYAEMAIL", limit: 40, comment: "客先担当者メアド"
    t.string "TXTANTOUSYADENWA", limit: 20, comment: "客先担当者電話番号"
    t.string "KBSEIKYUHOUSHIKI", limit: 2, null: false, comment: "請求方式区分"
    t.string "TXSIMEBI", limit: 10, null: false, comment: "締め日"
    t.string "CDNOUHINSYOYOSHIKI", limit: 4, comment: "納品書様式コード"
    t.string "KBNYUKINHOUHOU", limit: 2, null: false, comment: "標準入金方法区分"
    t.integer "VLNYUKINSAITO", limit: 2, null: false, comment: "売上入金サイト"
    t.integer "AMYOSHIN", null: false, comment: "与信限度額"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "担当営業№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "AMKISYUURIKAKE", comment: "期首売掛残高"
    t.integer "AMKEIJYOU", comment: "当期計上額"
    t.integer "AMKAISYU", comment: "当期回収額"
    t.integer "AMGENURIKAKE", comment: "現売掛残高"
  end

  create_table "DT011", primary_key: ["NRTORIHIKISAKI", "SQSYUKKASAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.integer "SQSYUKKASAKI", limit: 2, null: false, comment: "出荷先行"
    t.string "TXKANJI", limit: 40, null: false, comment: "出荷先名"
    t.string "NRYUBIN", limit: 8, null: false, comment: "郵便番号"
    t.string "TXJYUSYO", limit: 40, null: false, comment: "住所"
    t.string "NRDENWA", limit: 14, null: false, comment: "代表電話番号"
    t.string "NRFAX", limit: 14, comment: "FAX番号"
    t.integer "VLUNSOULT", limit: 2, null: false, comment: "運送リードタイム"
  end

  create_table "DT020", primary_key: "CDKAKERITSURANK", id: :string, limit: 2, comment: "掛率ランクＣ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "TXKAKERITSURANK", limit: 20, null: false, comment: "ランク記述"
    t.decimal "VLKAKERITSU", precision: 3, scale: 2, null: false, comment: "掛率"
  end

  create_table "DT100", primary_key: "NRURIAGE", id: :string, limit: 7, comment: "売掛増減№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBURIAGE", limit: 2, null: false, comment: "売上区分"
    t.date "DTURIAGE", null: false, comment: "売上日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.string "NRSYOHIN", limit: 7, comment: "売上商品№"
    t.string "TXSYOHIN", limit: 30, comment: "商品名／摘要"
    t.integer "PRHANBAI", comment: "標準販売価格"
    t.integer "PRURIAGE", comment: "売上単価"
    t.integer "QTURIAGE", null: false, comment: "売上数量"
    t.string "KBURIAGEUM", limit: 5, null: false, comment: "売上単位区分"
    t.integer "AMURIAGE", null: false, comment: "税抜売上額"
    t.integer "AMTAX", comment: "消費税額"
    t.integer "AMGENKA", comment: "売上原価"
    t.string "NRSEIKYU", limit: 7, comment: "請求№"
    t.string "NRJYUGYOIN", limit: 5, comment: "担当営業№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.datetime "DTCREATE", null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, null: false, comment: "取引年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "取引月序"
    t.integer "AMNEBIKI", null: false, comment: "値引額"
    t.integer "AMARARI", null: false, comment: "粗利額"
  end

  create_table "DT110", primary_key: "NRSEIKYU", id: :string, limit: 7, comment: "請求№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTSEIKYU", null: false, comment: "請求日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTHAKKOU", comment: "発行日"
    t.date "DTNYUKIN", comment: "入金確認日"
    t.integer "AMNYUKIN", comment: "前回以降入金額"
    t.integer "AMSEIKYU", null: false, comment: "請求額"
    t.string "STSEIKYU", limit: 2, null: false, comment: "請求状況"
    t.index ["NRTORIHIKISAKI"], name: "DT110_FK1"
  end

  create_table "DT120", primary_key: "NRJYURYOU", id: :string, limit: 7, comment: "受領№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.date "DTJYURYOU", null: false, comment: "受領日"
    t.string "KBNYUKINHOUHOU", limit: 2, null: false, comment: "入金方法区分"
    t.integer "AMJYURYOU", null: false, comment: "受領額"
    t.integer "AMTESURYOU", comment: "手数料額"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.index ["NRTORIHIKIKANRI"], name: "DT120_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "DT120_FK1"
  end

  create_table "ET010", primary_key: ["NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, comment: "標準ロケ№"
    t.integer "QTANZENZAIKO", comment: "安全在庫数"
    t.integer "QTJYOUGENZAIKO", comment: "上限在庫数"
    t.integer "QTKISYUZAIKO", comment: "期首在庫数"
    t.integer "QTNYUKO", comment: "当期入庫数"
    t.integer "QTSYUKKO", comment: "当期出庫数"
    t.integer "AMKISYUZAIKO", comment: "期首在庫額"
    t.integer "AMNYUKO", comment: "当期入庫額"
    t.integer "AMSYUKKO", comment: "当期出庫額"
    t.integer "QTGENZAIKO", comment: "現在庫数"
    t.integer "AMGENZAIKO", comment: "現在庫額"
    t.integer "PRIDOUHEIKIN", comment: "移動平均単価"
    t.index ["NRSOUKO"], name: "ET010_FK2"
  end

  create_table "ET100", primary_key: "NRUKEBARAI", id: :string, limit: 7, comment: "受払№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBAKADEN", limit: 2, null: false, comment: "赤黒"
    t.string "FGVALID", limit: 1, null: false, comment: "効区"
    t.string "KBUKEBARAI", limit: 2, null: false, comment: "受払区分"
    t.date "DTUKEBARAI", null: false, comment: "受払日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRIDOUSOUKO", limit: 5, comment: "移動倉庫№"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "取引先№"
    t.integer "SQSYUKKASAKI", limit: 2, comment: "出荷先行番"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "TXSYOHIN", limit: 30, comment: "商品名／摘要"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.integer "QTUKEBARAI", comment: "受払数量"
    t.integer "AMUKEBARAI", comment: "受払金額"
    t.integer "AMSAGAKU", comment: "取引差額"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.datetime "DTCREATE", null: false, comment: "記録日時"
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "SQMSEQ", limit: 2, null: false, comment: "月度"
    t.string "TXAITESAKI", limit: 40, comment: "相手先名"
  end

  create_table "ET200", primary_key: "NRTORIHIKIKANRI", id: :string, limit: 7, comment: "取引管理№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBYOTEI", limit: 2, null: false, comment: "受払予定区分"
    t.date "DTYOTEI", null: false, comment: "受払予定日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRIDOUSOUKO", limit: 5, comment: "移動倉庫№"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "取引先№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "QTYOTEI", comment: "受払予定数"
    t.string "NRSANSYOU", limit: 15, null: false, comment: "参照№"
    t.string "TXAITESAKI", limit: 40, comment: "相手先名"
    t.index ["NRSYOHIN", "NRSOUKO"], name: "ET200_FK1"
  end

  create_table "FT010", primary_key: "NRHATTYU", id: :string, limit: 7, comment: "発注№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTHATTYU", null: false, comment: "発注日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRJYUGYOIN", limit: 5, null: false, comment: "発注担当№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "入荷予定倉庫№"
    t.string "FGKAKUNIN", limit: 1, null: false, comment: "納期確認"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期初期値"
    t.date "DTHAKKO", comment: "発注書発行日"
    t.date "DTTORIKESHI", comment: "取消日"
    t.string "STHATTYU", limit: 2, null: false, comment: "発注状況"
    t.index ["NRTORIHIKISAKI"], name: "FT010_FK1"
  end

  create_table "FT011", primary_key: ["NRHATTYU", "SQHATTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false, comment: "発注№"
    t.integer "SQHATTYU", limit: 2, null: false, comment: "発注行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "発注商品№"
    t.decimal "PRHATTYU", precision: 10, scale: 2, null: false, comment: "発注単価"
    t.integer "QTHATTYU", null: false, comment: "発注数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTHAKKOU", null: false, comment: "発効日"
    t.integer "QTHATTYUKANZAN", null: false, comment: "在庫換算数"
    t.index ["NRSYOHIN", "NRTORIHIKISAKI", "DTHAKKOU"], name: "FT011_FK2"
  end

  create_table "FT012", primary_key: ["NRHATTYU", "SQHATTYU", "SQNYUKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRHATTYU", limit: 7, null: false, comment: "発注№"
    t.integer "SQHATTYU", limit: 2, null: false, comment: "発注行"
    t.integer "SQNYUKA", limit: 2, null: false, comment: "入荷行"
    t.date "DTYOTEINYUKA", null: false, comment: "予定入荷日"
    t.string "FGKAKUNIN", limit: 1, null: false, comment: "納期確認"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "入荷商品№"
    t.integer "QTYOTEISIIRE", null: false, comment: "仕入予定数"
    t.integer "QTJITSUSIIRE", comment: "実際仕入数"
    t.integer "QTDEFECT", comment: "不合格数"
    t.decimal "PRSIIRE", precision: 10, scale: 2, null: false, comment: "仕入単価"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRLOCATION", limit: 5, comment: "入庫ロケ№"
    t.string "NRNYUKA", limit: 7, comment: "入荷№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "NRSOUKO", limit: 5, comment: "予定入荷倉庫№"
    t.date "DTNYUKA", comment: "実際入荷日"
    t.integer "QTYOTEINYUKO", comment: "入庫予定数"
    t.integer "QTJITSUNYUKO", comment: "実際入庫数"
    t.decimal "AMSIIREGAIKA", precision: 11, scale: 2, comment: "外貨仕入額"
    t.integer "AMSIIRENAIKA", comment: "内貨仕入額"
    t.integer "AMTAX", comment: "消費税額"
    t.index ["NRTORIHIKIKANRI"], name: "FT012_SK1", unique: true
  end

  create_table "FT020", primary_key: "NRNYUKA", id: :string, limit: 7, comment: "入荷№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTNYUKA", null: false, comment: "入荷日"
    t.date "DTSIIRE", null: false, comment: "仕入計上日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "入荷倉庫№"
    t.string "STNYUKA", limit: 2, null: false, comment: "入荷状況"
    t.index ["NRTORIHIKISAKI"], name: "FT020_FK1"
  end

  create_table "GT010", primary_key: "NRJYUTYU", id: :string, limit: 7, comment: "受注№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "DTJYUTYU", null: false, comment: "受注日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.integer "SQSYUKKASAKI", limit: 2, null: false, comment: "出荷先行番"
    t.string "TXTYUBAN", limit: 15, comment: "顧客注文番号"
    t.string "NRSOUKO", limit: 5, null: false, comment: "出荷予定倉庫№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.date "DTTORIKESHI", comment: "取消日"
    t.string "NRMITSUMORI", limit: 7, comment: "見積№"
    t.integer "SQVERSION", limit: 2, comment: "見積版№"
    t.string "STJYUTYU", limit: 2, null: false, comment: "受注状況"
    t.index ["NRTORIHIKISAKI", "SQSYUKKASAKI"], name: "GT010_FK1"
  end

  create_table "GT011", primary_key: ["NRJYUTYU", "SQJYUTYU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false, comment: "受注№"
    t.integer "SQJYUTYU", limit: 2, null: false, comment: "受注行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "受注商品№"
    t.integer "PRJYUTYU", null: false, comment: "受注単価"
    t.integer "QTJYUTYU", null: false, comment: "受注数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.integer "QTSYUKKAZUMI", comment: "出荷済数量"
    t.integer "QTSYUKKAZAN", comment: "出荷残数量"
    t.index ["NRSYOHIN"], name: "GT011_FK2"
  end

  create_table "GT012", primary_key: ["NRJYUTYU", "SQJYUTYU", "SQSYUKKA"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRJYUTYU", limit: 7, null: false, comment: "受注№"
    t.integer "SQJYUTYU", limit: 2, null: false, comment: "受注行"
    t.integer "SQSYUKKA", limit: 2, null: false, comment: "出荷行"
    t.string "NRSOUKO", limit: 5, null: false, comment: "出荷倉庫№"
    t.date "DTYOTEISYUKKA", null: false, comment: "予定出荷日"
    t.integer "QTYOTEISYUKKA", null: false, comment: "出荷指示数"
    t.integer "PRSYUKKO", comment: "出庫単価"
    t.integer "PRSYUKKA", null: false, comment: "販売価格"
    t.integer "QTJITSUSYUKKA", comment: "出荷実績数"
    t.integer "QTTORIKESHI", comment: "出荷取消数"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRSYUKKA", limit: 7, comment: "出荷№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "AMTAX", comment: "消費税額"
    t.string "TXBUNNOU", limit: 5, null: false, comment: "分納マーク"
    t.index ["NRTORIHIKIKANRI"], name: "GT012_SK1", unique: true
  end

  create_table "GT020", primary_key: "NRSYUKKA", id: :string, limit: 7, comment: "出荷№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.integer "SQSYUKKASAKI", limit: 2, null: false, comment: "出荷先行番"
    t.string "NRSOUKO", limit: 5, null: false, comment: "出荷倉庫№"
    t.date "DTSYUKKA", null: false, comment: "出荷日"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRSEIKYU", limit: 7, comment: "都度請求№"
    t.datetime "TMHAKKOU", comment: "発行日時"
    t.datetime "TMKANRYO", comment: "完了日時"
    t.string "STSYUKKA", limit: 2, null: false, comment: "状況区分"
    t.index ["NRSEIKYU"], name: "GT020_SK1", unique: true
    t.index ["NRTORIHIKISAKI", "SQSYUKKASAKI"], name: "GT020_FK1"
  end

  create_table "GT030", primary_key: ["NRMITSUMORI", "SQVERSION"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false, comment: "見積№"
    t.integer "SQVERSION", limit: 2, null: false, comment: "見積版№"
    t.date "DTMITSUMORI", null: false, comment: "見積日"
    t.string "NRTORIHIKISAKI", limit: 8, comment: "顧客№"
    t.integer "SQSYUKKASAKI", limit: 2, comment: "出荷先行番"
    t.string "TXKOKYAKUMEI", limit: 40, comment: "未登録顧客名"
    t.string "TXTYUBAN", limit: 15, comment: "顧客注文番号"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRJYUTYU", limit: 7, comment: "受注№"
  end

  create_table "GT031", primary_key: ["NRMITSUMORI", "SQVERSION", "SQMITSUMORI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRMITSUMORI", limit: 7, null: false, comment: "見積№"
    t.integer "SQVERSION", limit: 2, null: false, comment: "見積版№"
    t.integer "SQMITSUMORI", limit: 2, null: false, comment: "見積行"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "見積商品№"
    t.integer "PRJYUTYU", null: false, comment: "見積単価"
    t.integer "QTJYUTYU", null: false, comment: "注文数量"
    t.date "DTKIBOUNOUKI", null: false, comment: "希望納期"
    t.index ["NRSYOHIN"], name: "GT031_FK1"
  end

  create_table "HT010", primary_key: "NRSIIREHURIKAE", id: :string, limit: 7, comment: "仕入振替№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBSIIREHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "AMTORIHIKI", null: false, comment: "税抜取引額"
    t.string "TXTEKIYO", limit: 30, comment: "振替摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "AMTAX", comment: "消費税額"
    t.index ["NRTORIHIKIKANRI"], name: "HT010_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "HT010_FK1"
  end

  create_table "HT020", primary_key: "NRTOKUSYUSIIRE", id: :string, limit: 7, comment: "特殊仕入№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUSIIRE", limit: 2, null: false, comment: "取引区分"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "取引倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.decimal "PRTORIHIKI", precision: 10, scale: 2, null: false, comment: "取引単価"
    t.integer "QTTORIHIKI", null: false, comment: "取引数量"
    t.string "KBTORIHIKIUM", limit: 5, null: false, comment: "取引単位区分"
    t.integer "PRUKEBARAI", comment: "受払単価"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "QTTORIHIKITAN", null: false, comment: "在庫単位換算数"
    t.decimal "AMTORIHIKI", precision: 10, scale: 2, comment: "税抜取引額"
    t.integer "AMTORIHIKINAIKA", comment: "内貨税抜取引額"
    t.integer "AMTAX", comment: "消費税額"
    t.date "DTHAKKOU", null: false, comment: "発効日"
    t.index ["NRTORIHIKIKANRI"], name: "HT020_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "HT020_FK1"
  end

  create_table "JT010", primary_key: "NRURIAGEHURIKAE", id: :string, limit: 7, comment: "売上振替№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBURIAGEHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.decimal "AMTORIHIKI", precision: 10, scale: 2, null: false, comment: "税抜取引額"
    t.string "TXTEKIYO", limit: 30, null: false, comment: "振替摘要"
    t.string "NRSEIKYU", limit: 7, null: false, comment: "都度請求№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "AMTAX", null: false, comment: "消費税額"
    t.index ["NRTORIHIKIKANRI"], name: "JT010_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "JT010_FK1"
  end

  create_table "JT020", primary_key: "NRTOKUSYUURIAGE", id: :string, limit: 7, comment: "特殊売上№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBTOKUSYUURIAGE", limit: 2, null: false, comment: "取引区分"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.integer "SQSYUKKASAKI", limit: 2, null: false, comment: "出荷先行番"
    t.date "DTTORIHIKI", null: false, comment: "取引日"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "取引倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "入庫ロケ№"
    t.integer "PRTORIHIKI", null: false, comment: "取引単価"
    t.integer "QTTORIHIKI", null: false, comment: "取引数量"
    t.integer "PRUKEBARAI", comment: "受払単価"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRSEIKYU", limit: 7, comment: "都度請求№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "AMTORIHIKI", comment: "税抜取引額"
    t.integer "AMTAX", comment: "消費税額"
    t.index ["NRTORIHIKIKANRI"], name: "JT020_SK1", unique: true
    t.index ["NRTORIHIKISAKI"], name: "JT020_FK1"
  end

  create_table "KT010", primary_key: "NRTANAOROSHI", id: :string, limit: 7, comment: "棚卸№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.datetime "DTKIJYUN", comment: "調査基準日時"
    t.datetime "DTKOUSHIN", comment: "確定更新日時"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "STTANAOROSHI", limit: 2, null: false, comment: "処理状況"
    t.index ["NRSOUKO"], name: "KT010_FK1"
    t.index ["NRTORIHIKIKANRI"], name: "KT010_SK1", unique: true
  end

  create_table "KT011", primary_key: ["NRTANAOROSHI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRTANAOROSHI", limit: 7, null: false, comment: "棚卸№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "商品№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.integer "PRUKEBARAI", comment: "受払単価"
    t.integer "QTTYOUBO", comment: "帳簿在庫数量"
    t.integer "QTJITSUTANA", comment: "実棚数量"
    t.integer "QTSASUU", comment: "実棚差数"
    t.integer "AMSAGAKU", comment: "実棚差額"
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
    t.string "STZAIKOIDOU", limit: 2, null: false, comment: "状況区分"
    t.index ["NRSOUKOFROM"], name: "KT020_FK1"
    t.index ["NRTORIHIKIKANRI"], name: "KT020_SK1", unique: true
  end

  create_table "KT021", primary_key: ["NRZAIKOIDOU", "SQZAIKOIDOU"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRZAIKOIDOU", limit: 7, null: false, comment: "移動指示№"
    t.integer "SQZAIKOIDOU", limit: 2, null: false, comment: "指示行"
    t.string "NRLOCATIONTO", limit: 5, comment: "先ロケ№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "商品№"
    t.integer "QTIDOU", null: false, comment: "移動数量"
    t.integer "PRIDOU", comment: "取引単価"
    t.string "NRTORIHIKIKANRIFROM", limit: 7, null: false, comment: "出庫管理№"
    t.string "NRTORIHIKIKANRITO", limit: 7, null: false, comment: "入庫管理№"
    t.index ["NRTORIHIKIKANRIFROM"], name: "KT021_SK1", unique: true
    t.index ["NRTORIHIKIKANRITO"], name: "KT021_SK2", unique: true
  end

  create_table "KT030", primary_key: "NRZAIKOHURIKAE", id: :string, limit: 7, comment: "在庫振替№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "KBZAIKOHURIKAE", limit: 2, null: false, comment: "振替区分"
    t.date "DTHURIKAE", null: false, comment: "振替日"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.string "NRLOCATION", limit: 5, null: false, comment: "ロケ№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "QTHURIKAE", comment: "振替数量"
    t.integer "AMHURIKAE", comment: "振替金額"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.index ["NRSYOHIN"], name: "KT030_FK1"
    t.index ["NRTORIHIKIKANRI"], name: "KT030_SK1", unique: true
  end

  create_table "LT010", primary_key: "NRSET", id: :string, limit: 7, comment: "セット指示№", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.date "DTYOTEI", null: false, comment: "作業予定日"
    t.datetime "TMHAKKOU", comment: "発行日時"
    t.datetime "TMJISSEKI", comment: "実際完了日時"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "セット品内部商品№"
    t.integer "QTSHIJI", null: false, comment: "予定セット数"
    t.integer "QTJISSEKI", comment: "実績セット数"
    t.integer "AMJISSEKI", comment: "実績取引額"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "TXTEKIYO", limit: 300, comment: "摘要"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.string "STSET", limit: 2, null: false, comment: "指示状況"
    t.index ["NRSYOHIN"], name: "LT010_FK1"
    t.index ["NRTORIHIKIKANRI"], name: "LT010_SK1", unique: true
  end

  create_table "LT011", primary_key: ["NRSET", "SQKOUSEI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "NRSET", limit: 7, null: false, comment: "セット指示№"
    t.integer "SQKOUSEI", limit: 2, null: false, comment: "構成行"
    t.string "NRCHILD", limit: 7, null: false, comment: "構成品内部商品№"
    t.integer "QTSHIJI", comment: "予定取引数"
    t.integer "QTJISSEKI", comment: "実績取引数"
    t.integer "PRTORIHIKI", comment: "取引単価"
    t.string "NRLOCATION", limit: 5, comment: "ロケ№"
    t.string "TXLOTNUMBER", limit: 40, comment: "ロット№"
    t.string "NRTORIHIKIKANRI", limit: 7, null: false, comment: "取引管理№"
    t.integer "AMJISSEKI", comment: "実績取引額"
    t.index ["NRCHILD"], name: "LT011_FK2"
    t.index ["NRTORIHIKIKANRI"], name: "LT011_SK1", unique: true
  end

  create_table "YT010", primary_key: "DTNEND", id: :integer, limit: 2, comment: "年度", default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "AMURIKISYUZAN", comment: "期首売掛残高"
    t.bigint "AMURISYUK", comment: "期間出荷売上額"
    t.integer "AMURITYOK", comment: "期間直出荷売上"
    t.bigint "AMURIHENPIN", comment: "期間出荷返品額"
    t.bigint "AMURIZATSUEKI", comment: "期間雑益売上額"
    t.bigint "AMURIZATSUSON", comment: "期間雑損振替額"
    t.bigint "AMURISOUSAI", comment: "期間売上相殺額"
    t.bigint "AMURINEBIKI", comment: "期間営業値引額"
    t.bigint "AMURIHANHURI", comment: "期間販売費振替"
    t.bigint "AMURIJYURYO", comment: "期間売上受領額"
    t.bigint "AMURIGENKA", comment: "期間売上原価"
    t.bigint "AMURITAX", comment: "期間売上消費税"
    t.bigint "AMKAIKISYUZAN", comment: "期首買掛残高"
    t.bigint "AMKAINYUK", comment: "期間入荷仕入額"
    t.bigint "AMKAITYOK", comment: "期間直入荷仕入"
    t.bigint "AMKAIHENPIN", comment: "期間入荷返品額"
    t.bigint "AMKAIZATSUEKI", comment: "期間雑益振替額"
    t.bigint "AMKAIZATSUSON", comment: "期間雑損仕入額"
    t.bigint "AMKAISOUSAI", comment: "期間仕入相殺額"
    t.bigint "AMKAIGENKA", comment: "期間原価振替額"
    t.bigint "AMKAISIHARAI", comment: "期間仕入支払額"
    t.bigint "AMKAITAX", comment: "期間仕入消費税"
    t.bigint "AMZAIKISYUZAN", comment: "期首在庫残高"
    t.bigint "AMZAINYUK", comment: "期間仕入入庫額"
    t.bigint "AMZAINYUKHEN", comment: "期間仕入返品額"
    t.bigint "AMZAISYUK", comment: "期間売上出庫額"
    t.bigint "AMZAISYUKHEN", comment: "期間売上返品額"
    t.bigint "AMZAIIDOU", comment: "期間移動額"
    t.bigint "AMZAIGENMOU", comment: "期間減耗額"
    t.bigint "AMZAIHYOKAZON", comment: "期間評価損額"
    t.bigint "AMZAIHYOKAEKI", comment: "期間評価益額"
    t.bigint "AMZAISIKAKARI", comment: "期間仕掛出庫額"
    t.bigint "AMZAIZATSUSON", comment: "期間雑損額"
    t.bigint "AMZAIZATSUEKI", comment: "期間雑益額"
    t.bigint "AMZAIKANSEI", comment: "期間完成入庫額"
    t.bigint "AMZAIKAKOUHI", comment: "期間加工費繰入"
    t.bigint "AMZAIZOUGEN", comment: "期間棚増減額"
    t.bigint "AMURIARARI", comment: "期間粗利額"
    t.bigint "AMURIMATSUZAN", comment: "期末売掛残高"
    t.bigint "AMKAIMATSUZAN", comment: "期末買掛残高"
    t.bigint "AMZAIKIMATSUZAN", comment: "期末在庫残高"
  end

  create_table "YT020", primary_key: ["DTNEND", "DTMSEQ"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.integer "AMURIKISYUZAN", comment: "期首売掛残高"
    t.integer "AMURISYUK", comment: "期間出荷売上額"
    t.integer "AMURITYOK", comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", comment: "期間雑損振替額"
    t.integer "AMURISOUSAI", comment: "期間売上相殺額"
    t.integer "AMURINEBIKI", comment: "期間営業値引額"
    t.integer "AMURIHANHURI", comment: "期間販売費振替"
    t.integer "AMURIJYURYO", comment: "期間売上受領額"
    t.integer "AMURIGENKA", comment: "期間売上原価"
    t.integer "AMURITAX", comment: "期間売上消費税"
    t.integer "AMKAIKISYUZAN", comment: "期首買掛残高"
    t.integer "AMKAINYUK", comment: "期間入荷仕入額"
    t.integer "AMKAITYOK", comment: "期間直入荷仕入"
    t.integer "AMKAIHENPIN", comment: "期間入荷返品額"
    t.integer "AMKAIZATSUEKI", comment: "期間雑益振替額"
    t.integer "AMKAIZATSUSON", comment: "期間雑損仕入額"
    t.integer "AMKAISOUSAI", comment: "期間仕入相殺額"
    t.integer "AMKAIGENKA", comment: "期間原価振替額"
    t.integer "AMKAISIHARAI", comment: "期間仕入支払額"
    t.integer "AMKAITAX", comment: "期間仕入消費税"
    t.integer "AMZAIKISYUZAN", comment: "期首在庫残高"
    t.integer "AMZAINYUK", comment: "期間仕入入庫額"
    t.integer "AMZAINYUKHEN", comment: "期間仕入返品額"
    t.integer "AMZAISYUK", comment: "期間売上出庫額"
    t.integer "AMZAISYUKHEN", comment: "期間売上返品額"
    t.integer "AMZAIIDOU", comment: "期間移動額"
    t.integer "AMZAIGENMOU", comment: "期間減耗額"
    t.integer "AMZAIHYOKAZON", comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", comment: "期間仕掛出庫額"
    t.integer "AMZAIZATSUSON", comment: "期間雑損額"
    t.integer "AMZAIZATSUEKI", comment: "期間雑益額"
    t.integer "AMZAIKANSEI", comment: "期間完成入庫額"
    t.integer "AMZAIKAKOUHI", comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", comment: "期間棚増減額"
    t.integer "AMURIARARI", comment: "期間粗利額"
    t.integer "AMURIMATSUZAN", comment: "期末売掛残高"
    t.integer "AMKAIMATSUZAN", comment: "期末買掛残高"
    t.integer "AMZAIKIMATSUZAN", comment: "期末在庫残高"
  end

  create_table "YT030", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMZAIKISYUZAN", comment: "期首在庫残高"
    t.integer "QTZAIKISYUZAN", comment: "期首在庫残数"
    t.integer "AMZAINYUK", comment: "期間仕入入庫額"
    t.integer "QTZAINYUK", comment: "期間仕入入庫数"
    t.integer "AMZAINYUKHEN", comment: "期間仕入返品額"
    t.integer "QTZAINYUKHEN", comment: "期間仕入返品数"
    t.integer "AMZAISYUK", comment: "期間売上出庫額"
    t.integer "QTZAISYUK", comment: "期間売上出庫数"
    t.integer "AMZAISYUKHEN", comment: "期間売上返品額"
    t.integer "QTZAISYUKHEN", comment: "期間売上返品数"
    t.integer "AMZAIIDOU", comment: "期間移動額"
    t.integer "QTZAIIDOU", comment: "期間移動数"
    t.integer "AMZAIGENMOU", comment: "期間減耗額"
    t.integer "QTZAIGENMOU", comment: "期間減耗数"
    t.integer "AMZAIHYOKAZON", comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", comment: "期間仕掛出庫額"
    t.integer "QTZAISIKAKARI", comment: "期間仕掛出庫数"
    t.integer "AMZAIZATSUSON", comment: "期間雑損額"
    t.integer "QTZAIZATSUSON", comment: "期間雑損数"
    t.integer "AMZAIZATSUEKI", comment: "期間雑益額"
    t.integer "QTZAIZATSUEKI", comment: "期間雑益数"
    t.integer "AMZAIKANSEI", comment: "期間完成入庫額"
    t.integer "QTZAIKANSEI", comment: "期間完成入庫数"
    t.integer "AMZAIKAKOUHI", comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", comment: "期間棚増減額"
    t.integer "QTZAIZOUGEN", comment: "期間棚増減数"
    t.integer "AMZAIARARI", comment: "期間粗利額"
    t.integer "AMZAIKIMATSUZAN", comment: "期末在庫残高"
    t.integer "QTZAIKIMATSUZAN", comment: "期末在庫残数"
    t.index ["NRSYOHIN"], name: "YT030_FK1"
  end

  create_table "YT031", primary_key: ["DTNEND", "DTMSEQ", "NRSYOHIN", "NRSOUKO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.string "NRSOUKO", limit: 5, null: false, comment: "倉庫№"
    t.integer "AMZAIKISYUZAN", comment: "期首在庫残高"
    t.integer "QTZAIKISYUZAN", comment: "期首在庫残数"
    t.integer "AMZAINYUK", comment: "期間仕入入庫額"
    t.integer "QTZAINYUK", comment: "期間仕入入庫数"
    t.integer "AMZAINYUKHEN", comment: "期間仕入返品額"
    t.integer "QTZAINYUKHEN", comment: "期間仕入返品数"
    t.integer "AMZAISYUK", comment: "期間売上出庫額"
    t.integer "QTZAISYUK", comment: "期間売上出庫数"
    t.integer "AMZAISYUKHEN", comment: "期間売上返品額"
    t.integer "QTZAISYUKHEN", comment: "期間売上返品数"
    t.integer "AMZAIIDOU", comment: "期間移動額"
    t.integer "QTZAIIDOU", comment: "期間移動数"
    t.integer "AMZAIGENMOU", comment: "期間減耗額"
    t.integer "QTZAIGENMOU", comment: "期間減耗数"
    t.integer "AMZAIHYOKAZON", comment: "期間評価損額"
    t.integer "AMZAIHYOKAEKI", comment: "期間評価益額"
    t.integer "AMZAISIKAKARI", comment: "期間仕掛出庫額"
    t.integer "QTZAISIKAKARI", comment: "期間仕掛出庫数"
    t.integer "AMZAIZATSUSON", comment: "期間雑損額"
    t.integer "QTZAIZATSUSON", comment: "期間雑損数"
    t.integer "AMZAIZATSUEKI", comment: "期間雑益額"
    t.integer "QTZAIZATSUEKI", comment: "期間雑益数"
    t.integer "AMZAIKANSEI", comment: "期間完成入庫額"
    t.integer "QTZAIKANSEI", comment: "期間完成入庫数"
    t.integer "AMZAIKAKOUHI", comment: "期間加工費繰入"
    t.integer "AMZAIZOUGEN", comment: "期間棚増減額"
    t.integer "QTZAIZOUGEN", comment: "期間棚増減数"
    t.integer "AMZAIARARI", comment: "期間粗利額"
    t.integer "AMZAIKIMATSUZAN", comment: "期末在庫残高"
    t.integer "QTZAIKIMATSUZAN", comment: "期末在庫残数"
    t.index ["NRSYOHIN", "NRSOUKO"], name: "YT031_FK2"
  end

  create_table "YT040", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.integer "AMKAIKISYUZAN", comment: "期首買掛残高"
    t.integer "AMKAINYUK", comment: "期間入荷仕入額"
    t.integer "AMKAITYOK", comment: "期間直入荷仕入"
    t.integer "AMKAIHENPIN", comment: "期間入荷返品額"
    t.integer "AMKAIZATSUEKI", comment: "期間雑益振替額"
    t.integer "AMKAIZATSUSON", comment: "期間雑損仕入額"
    t.integer "AMKAISOUSAI", comment: "期間仕入相殺額"
    t.integer "AMKAIGENKA", comment: "期間原価振替額"
    t.integer "AMKAISIHARAI", comment: "期間支払額"
    t.integer "AMKAITAX", comment: "期間消費税"
    t.integer "AMKAIMATSUZAN", comment: "期末買掛残高"
    t.index ["NRTORIHIKISAKI"], name: "YT040_FK2"
  end

  create_table "YT041", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "仕入先№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMKAINYUK", comment: "期間入荷仕入額"
    t.integer "QTKAINYUK", comment: "期間入荷仕入数"
    t.integer "AMKAITYOK", comment: "期間直入荷仕入額"
    t.integer "QTKAITYOK", comment: "期間直入荷仕入数"
    t.integer "AMKAIHENPIN", comment: "期間入荷返品額"
    t.integer "QTKAIHENPIN", comment: "期間入荷返品数"
    t.integer "AMKAIGENKA", comment: "期間原価振替額"
    t.integer "AMKAITAX", comment: "期間仕入消費税"
  end

  create_table "YT050", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.integer "AMURIKISYUZAN", comment: "期首売掛残高"
    t.integer "AMURISYUK", comment: "期間出荷売上額"
    t.integer "AMURITYOK", comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", comment: "期間雑損振替額"
    t.integer "AMURISOUSAI", comment: "期間売上相殺額"
    t.integer "AMURINEBIKI", comment: "期間営業値引額"
    t.integer "AMURIHANHURI", comment: "期間販売費振替"
    t.integer "AMURIJYURYO", comment: "期間受領額"
    t.integer "AMURIGENKA", comment: "期間売上原価"
    t.integer "AMURITAX", comment: "期間消費税"
    t.integer "AMURIARARI", comment: "期間粗利額"
    t.integer "AMURIMATSUZAN", comment: "期末売掛残高"
    t.index ["NRTORIHIKISAKI"], name: "YT050_FK2"
  end

  create_table "YT051", primary_key: ["DTNEND", "DTMSEQ", "NRTORIHIKISAKI", "NRSYOHIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRTORIHIKISAKI", limit: 8, null: false, comment: "顧客№"
    t.string "NRSYOHIN", limit: 7, null: false, comment: "内部商品№"
    t.integer "AMURISYUK", comment: "期間出荷売上額"
    t.integer "QTURISYUK", comment: "期間出荷売上数"
    t.integer "AMURITYOK", comment: "期間直出荷売上額"
    t.integer "QTURITYOK", comment: "期間直出荷売上数"
    t.integer "AMURIHENPIN", comment: "期間出荷返品額"
    t.integer "QTURIHENPIN", comment: "期間出荷返品数"
    t.integer "AMURINEBIKI", comment: "期間営業値引額"
    t.integer "AMURIHANHURI", comment: "期間販売費振替"
    t.integer "AMURIGENKA", comment: "期間売上原価"
    t.integer "AMURITAX", comment: "期間売上消費税"
    t.integer "AMURIARARI", comment: "期間粗利額"
  end

  create_table "YT060", primary_key: ["DTNEND", "DTMSEQ", "NRTANTOUJYUGYOIN"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "DTNEND", limit: 2, null: false, comment: "年度"
    t.integer "DTMSEQ", limit: 2, null: false, comment: "月序"
    t.string "NRTANTOUJYUGYOIN", limit: 5, null: false, comment: "担当営業№"
    t.integer "AMURISYUK", comment: "期間出荷売上額"
    t.integer "AMURITYOK", comment: "期間直出荷売上"
    t.integer "AMURIHENPIN", comment: "期間出荷返品額"
    t.integer "AMURIZATSUEKI", comment: "期間雑益売上額"
    t.integer "AMURIZATSUSON", comment: "期間雑損振替額"
    t.integer "AMURINEBIKI", comment: "期間営業値引額"
    t.integer "AMURIHANHURI", comment: "期間販売費振替"
    t.integer "AMURIGENKA", comment: "期間売上原価"
    t.integer "AMURITAX", comment: "期間売上消費税"
    t.integer "AMURIARARI", comment: "期間粗利額"
  end

  add_foreign_key "AT011", "AT010", column: "CDBUMON", primary_key: "CDBUMON", name: "AT011_FK2"
  add_foreign_key "AT011", "AT010", column: "CDJYOUIBUMON", primary_key: "CDBUMON", name: "AT011_FK1"
  add_foreign_key "AT021", "AT010", column: "CDBUMON", primary_key: "CDBUMON", name: "AT021_FK2"
  add_foreign_key "AT021", "AT020", column: "NRJYUGYOIN", primary_key: "NRJYUGYOIN", name: "AT021_FK1"
  add_foreign_key "BT020", "BT010", column: "CDMAKER", primary_key: "CDMAKER", name: "BT020_FK1"
  add_foreign_key "BT021", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "BT021_FK1"
  add_foreign_key "BT031", "BT030", column: "NRSOUKO", primary_key: "NRSOUKO", name: "BT031_FK1"
  add_foreign_key "CT010", "AT030", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "CT010_FK1"
  add_foreign_key "CT011", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "CT011_FK1"
  add_foreign_key "CT011", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "CT011_FK2"
  add_foreign_key "CT110", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "CT110_FK1"
  add_foreign_key "DT011", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "DT011_FK1"
  add_foreign_key "DT110", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "DT110_FK1"
  add_foreign_key "DT120", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "DT120_FK1"
  add_foreign_key "ET010", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "ET010_FK1"
  add_foreign_key "ET010", "BT030", column: "NRSOUKO", primary_key: "NRSOUKO", name: "ET010_FK2"
  add_foreign_key "ET200", "ET010", column: "NRSOUKO", primary_key: "NRSOUKO", name: "ET200_FK1_1"
  add_foreign_key "ET200", "ET010", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "ET200_FK1_2"
  add_foreign_key "FT010", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "FT010_FK1"
  #add_foreign_key "FT011", "CT011", column: "DTHAKKOU", primary_key: "DTHAKKOU", name: "FT011_FK2_1"
  add_foreign_key "FT011", "CT011", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "FT011_FK2_2"
  add_foreign_key "FT011", "CT011", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "FT011_FK2_3"
  add_foreign_key "FT011", "FT010", column: "NRHATTYU", primary_key: "NRHATTYU", name: "FT011_FK1"
  add_foreign_key "FT012", "ET200", column: "NRTORIHIKIKANRI", primary_key: "NRTORIHIKIKANRI", name: "FT012_FK2"
  add_foreign_key "FT012", "FT011", column: "NRHATTYU", primary_key: "NRHATTYU", name: "FT012_FK1"
#  add_foreign_key "FT012", "FT011", column: "SQHATTYU", primary_key: "SQHATTYU", name: "FT012_FK1"
  add_foreign_key "FT020", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "FT020_FK1"
  add_foreign_key "GT010", "DT011", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "GT010_FK1"
#  add_foreign_key "GT010", "DT011", column: "SQSYUKKASAKI", primary_key: "SQSYUKKASAKI", name: "GT010_FK1_2"
  add_foreign_key "GT011", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "GT011_FK2"
  add_foreign_key "GT011", "GT010", column: "NRJYUTYU", primary_key: "NRJYUTYU", name: "GT011_FK1"
  add_foreign_key "GT012", "ET200", column: "NRTORIHIKIKANRI", primary_key: "NRTORIHIKIKANRI", name: "GT012_FK2"
  add_foreign_key "GT012", "GT011", column: "NRJYUTYU", primary_key: "NRJYUTYU", name: "GT012_FK1"
#  add_foreign_key "GT012", "GT011", column: "SQJYUTYU", primary_key: "SQJYUTYU", name: "GT012_FK1"
  add_foreign_key "GT020", "DT011", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "GT020_FK1"
#  add_foreign_key "GT020", "DT011", column: "SQSYUKKASAKI", primary_key: "SQSYUKKASAKI", name: "GT020_FK1_1"
  add_foreign_key "GT031", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "GT031_FK1"
  add_foreign_key "GT031", "GT030", column: "NRMITSUMORI", primary_key: "NRMITSUMORI", name: "GT031_FK2"
#  add_foreign_key "GT031", "GT030", column: "SQVERSION", primary_key: "SQVERSION", name: "GT031_FK2"
  add_foreign_key "HT010", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "HT010_FK1"
  add_foreign_key "HT020", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "HT020_FK1"
  add_foreign_key "JT010", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "JT010_FK1"
  add_foreign_key "JT020", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "JT020_FK1"
  add_foreign_key "KT010", "BT030", column: "NRSOUKO", primary_key: "NRSOUKO", name: "KT010_FK1"
  add_foreign_key "KT011", "KT010", column: "NRTANAOROSHI", primary_key: "NRTANAOROSHI", name: "KT011_FK1"
  add_foreign_key "KT020", "BT030", column: "NRSOUKOFROM", primary_key: "NRSOUKO", name: "KT020_FK1"
  add_foreign_key "KT021", "ET200", column: "NRTORIHIKIKANRIFROM", primary_key: "NRTORIHIKIKANRI", name: "KT021_FK3"
  add_foreign_key "KT021", "ET200", column: "NRTORIHIKIKANRITO", primary_key: "NRTORIHIKIKANRI", name: "KT021_FK2"
  add_foreign_key "KT021", "KT020", column: "NRZAIKOIDOU", primary_key: "NRZAIKOIDOU", name: "KT021_FK1"
  add_foreign_key "KT030", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "KT030_FK1"
  add_foreign_key "LT010", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "LT010_FK1"
  add_foreign_key "LT010", "ET200", column: "NRTORIHIKIKANRI", primary_key: "NRTORIHIKIKANRI", name: "LT010_FK2"
  add_foreign_key "LT011", "BT020", column: "NRCHILD", primary_key: "NRSYOHIN", name: "LT011_FK2"
  add_foreign_key "LT011", "ET200", column: "NRTORIHIKIKANRI", primary_key: "NRTORIHIKIKANRI", name: "LT011_FK3"
  add_foreign_key "LT011", "LT010", column: "NRSET", primary_key: "NRSET", name: "LT011_FK1"
  add_foreign_key "YT020", "YT010", column: "DTNEND", primary_key: "DTNEND", name: "YT020_FK1"
  add_foreign_key "YT030", "BT020", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "YT030_FK1"
#  add_foreign_key "YT030", "YT020", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT030_FK2"
  add_foreign_key "YT030", "YT020", column: "DTNEND", primary_key: "DTNEND", name: "YT030_FK2"
  add_foreign_key "YT031", "ET010", column: "NRSOUKO", primary_key: "NRSOUKO", name: "YT031_FK2_1"
  add_foreign_key "YT031", "ET010", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "YT031_FK2"
#  add_foreign_key "YT031", "YT030", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT031_FK1"
  add_foreign_key "YT031", "YT030", column: "DTNEND", primary_key: "DTNEND", name: "YT031_FK1"
  add_foreign_key "YT031", "YT030", column: "NRSYOHIN", primary_key: "NRSYOHIN", name: "YT031_FK1_1"
  add_foreign_key "YT040", "CT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "YT040_FK2"
#  add_foreign_key "YT040", "YT020", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT040_FK1"
  add_foreign_key "YT040", "YT020", column: "DTNEND", primary_key: "DTNEND", name: "YT040_FK1"
#  add_foreign_key "YT041", "YT040", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT041_FK1"
  add_foreign_key "YT041", "YT040", column: "DTNEND", primary_key: "DTNEND", name: "YT041_FK1"
  add_foreign_key "YT041", "YT040", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "YT041_FK1_1"
  add_foreign_key "YT050", "DT010", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "YT050_FK2"
#  add_foreign_key "YT050", "YT020", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT050_FK1"
#  add_foreign_key "YT050", "YT020", column: "DTNEND", primary_key: "DTNEND", name: "YT050_FK1"
#  add_foreign_key "YT051", "YT050", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT051_FK1"
#  add_foreign_key "YT051", "YT050", column: "DTNEND", primary_key: "DTNEND", name: "YT051_FK1"
  add_foreign_key "YT051", "YT050", column: "NRTORIHIKISAKI", primary_key: "NRTORIHIKISAKI", name: "YT051_FK1"
#  add_foreign_key "YT060", "YT020", column: "DTMSEQ", primary_key: "DTMSEQ", name: "YT060_FK1"
#  add_foreign_key "YT060", "YT020", column: "DTNEND", primary_key: "DTNEND", name: "YT060_FK1"
end
